using System.Diagnostics.CodeAnalysis;
using System.Linq.Expressions;

namespace DomainFixture;

public abstract partial class FixtureConfiguration<TEntity>
    where TEntity : class
{
    public IStringPropertyBuilder<TEntity> Property(Expression<Func<TEntity, string>> propertyExpression)
    {
        if (ConfigurationBuilder is not EntityConfigurationBuilder<TEntity> entityBuilder)
            throw new InvalidCastException($"Unable to cast to {nameof(EntityConfigurationBuilder<TEntity>)}");

        var builder = new StringPropertyBuilder<TEntity>(propertyExpression);

        entityBuilder.PropertyBuilders.Add(builder);

        return builder;
    }
}

public interface IStringPropertyBuilder<TEntity> :
    IConventionsPropertyBuilder<string, TEntity>,
    IScenarioBuilder<string, TEntity>
{
    public IStringScenarioBuilder<TEntity> Length(int start, int end);
    public IStringScenarioBuilder<TEntity> Length(int length);
    public IStringScenarioBuilder<TEntity> Empty();
    public IStringScenarioBuilder<TEntity> NotEmpty();
}

public class StringPropertyBuilder<TEntity> :
    ConventionsPropertyBuilder<string, TEntity>,
    IStringPropertyBuilder<TEntity>
{

    public StringPropertyBuilder(Expression<Func<TEntity, string>> propertyExpression) : base(propertyExpression)
    {
    }

    private IList<IScenarioBuilder<string, TEntity, IPropertyBuilder<string, TEntity>>> Scenarios
        => ((IScenarioBuilder<string, TEntity>)this).Scenarios;

    [SuppressMessage("ReSharper", "UnassignedGetOnlyAutoProperty")]
    IList<IScenarioBuilder<string, TEntity, IPropertyBuilder<string, TEntity>>>
        IScenarioBuilder<string, TEntity>.Scenarios { get; }
        = new List<IScenarioBuilder<string, TEntity, IPropertyBuilder<string, TEntity>>>();

    public IStringScenarioBuilder<TEntity> Length(int start, int end)
    {
        var scenario = new StringScenario<TEntity>(start, end);
        var builder = new StringScenarioBuilder<TEntity>(scenario, this);

        Scenarios.Add(builder);

        return builder;
    }

    public IStringScenarioBuilder<TEntity> Length(int length)
    {
        var scenario = new StringScenario<TEntity>(length);
        var builder = new StringScenarioBuilder<TEntity>(scenario, this);

        Scenarios.Add(builder);

        return builder;
    }

    public IStringScenarioBuilder<TEntity> Empty()
    {
        var scenario = new StringScenario<TEntity>(Empty: true);
        var builder = new StringScenarioBuilder<TEntity>(scenario, this);

        Scenarios.Add(builder);

        return builder;
    }

    public IStringScenarioBuilder<TEntity> NotEmpty()
    {
        var scenario = new StringScenario<TEntity>(Empty: false);
        var builder = new StringScenarioBuilder<TEntity>(scenario, this);

        Scenarios.Add(builder);

        return builder;
    }
}

public interface IScenarioBuilder : IPropertyBuilder
{
}

public interface IScenarioBuilder<TProperty, TEntity> :
    IPropertyBuilder<TProperty, TEntity>,
    IScenarioBuilder
{
    internal IList<IScenarioBuilder<TProperty, TEntity, IPropertyBuilder<TProperty, TEntity>>> Scenarios { get; }
}

public interface IScenarioBuilder<TProperty, TEntity, out TPropertyBuilder> :
    IScenarioBuilder<TProperty, TEntity>
    where TPropertyBuilder : IPropertyBuilder<TProperty, TEntity>
{
    public TPropertyBuilder IsValid();
    public TPropertyBuilder IsInvalid();
}

public interface IStringScenarioBuilder<TEntity> :
    IScenarioBuilder<string, TEntity, IStringPropertyBuilder<TEntity>>
{
    public IStringScenarioBuilder<TEntity> Numerical();
    public IStringScenarioBuilder<TEntity> Alphabetical();
}

public abstract class ScenarioBuilder<TPropertyBuilder, TProperty, TEntity, TScenario> :
    IScenarioBuilder<TProperty, TEntity, TPropertyBuilder>
    where TPropertyBuilder : IGenericPropertyBuilder<TProperty, TEntity>
    where TScenario : IScenario<TProperty, TEntity>
{
    protected readonly TPropertyBuilder Builder;

    protected ScenarioBuilder(TScenario scenario, TPropertyBuilder builder)
    {
        Scenario = scenario;
        Builder = builder;
    }

    protected TScenario Scenario { get; set; }

    public virtual TPropertyBuilder IsValid()
    {
        var applier = new ScenarioApplier<TProperty, TEntity>(
            new(
                value => Builder.Valid(value),
                func => Builder.Valid(func)
            ),
            new(
                value => Builder.Invalid(value),
                func => Builder.Invalid(func)
            )
        );

        ApplyScenario(applier, true);

        return Builder;
    }

    public virtual TPropertyBuilder IsInvalid()
    {
        var applier = new ScenarioApplier<TProperty, TEntity>(
            new(
                value => Builder.Invalid(value),
                func => Builder.Invalid(func)
            ),
            new(
                value => Builder.Valid(value),
                func => Builder.Valid(func)
            )
        );

        ApplyScenario(applier, false);

        return Builder;
    }

    IList<IScenarioBuilder<TProperty, TEntity, IPropertyBuilder<TProperty, TEntity>>>
        IScenarioBuilder<TProperty, TEntity>.Scenarios { get; }
        = new List<IScenarioBuilder<TProperty, TEntity, IPropertyBuilder<TProperty, TEntity>>>();

    protected abstract void ApplyScenario(ScenarioApplier<TProperty, TEntity> applier, bool valid);
}

public record ScenarioApplierOptions<TProperty, TEntity>(Action<TProperty> Constant,
    Action<Expression<Func<TEntity, TProperty>>> Delegate);

public record ScenarioApplier<TProperty, TEntity>(ScenarioApplierOptions<TProperty, TEntity> Success,
    ScenarioApplierOptions<TProperty, TEntity> Failure);

public class StringScenarioBuilder<TEntity> :
    ScenarioBuilder<IStringPropertyBuilder<TEntity>, string, TEntity, StringScenario<TEntity>>,
    IStringScenarioBuilder<TEntity>
{
    public StringScenarioBuilder(StringScenario<TEntity> scenario, IStringPropertyBuilder<TEntity> builder)
        : base(scenario, builder)
    {
    }

    public IStringScenarioBuilder<TEntity> Numerical() => SetCharacterSet(CharacterSet.Numerical);

    public IStringScenarioBuilder<TEntity> Alphabetical() => SetCharacterSet(CharacterSet.Alphabetical);

    protected override void ApplyScenario(ScenarioApplier<string, TEntity> applier, bool valid)
    {
        ApplyLengthStart(applier, valid);
        ApplyLengthEnd(applier, valid);
        ApplyEmpty(applier, valid);
    }

    private void ApplyEmpty(ScenarioApplier<string, TEntity> applier, bool valid)
    {
        if (Scenario.Empty is null) return;

        var @delegate = Scenario.Empty is true ? applier.Success.Constant : applier.Failure.Constant;

        @delegate(Scenario.CreateShortestString(' '));
        @delegate(Scenario.LengthStart == 0 ? Scenario.CreateString(1, ' ') : Scenario.CreateLongestString(' '));
    }

    private void ApplyLengthStart(ScenarioApplier<string, TEntity> applier, bool valid)
    {
        var length = Scenario.ShortestLength;
        if (length <= 0) return;

        applier.Success.Constant(Scenario.CreateShortestString());
        if (valid)
            applier.Failure.Constant(Scenario.CreateString(length - 1));
    }

    private void ApplyLengthEnd(ScenarioApplier<string, TEntity> applier, bool valid)
    {
        var startLength = Scenario.ShortestLength;
        var endLength = Scenario.LongestLength;
        if (endLength is null) return;
        if (startLength >= endLength) return;

        applier.Success.Constant(Scenario.CreateLongestString());

        if (Scenario.LengthEnd is not int.MaxValue)
        {
            applier.Failure.Constant(Scenario.CreateString(endLength.Value + 1));
        }
    }

    private IStringScenarioBuilder<TEntity> SetCharacterSet(CharacterSet characterSet)
    {
        Scenario = Scenario with
        {
            CharacterSet = characterSet
        };

        return this;
    }
}

public interface IScenario<in TProperty, TEntity>
{
}

public record StringScenario<TEntity>(
    int? LengthStart = null,
    int? LengthEnd = null,
    bool? Empty = null,
    CharacterSet CharacterSet = CharacterSet.Alphabetical
) : IScenario<string, TEntity>
{
    public int? LongestLength => LengthEnd ?? LengthStart;
    public int ShortestLength => LengthStart ?? 0;

    public string CreateShortestString(char? character = null)
    {
        return CreateString(LengthStart ?? 0, character ?? CreateCharacter());
    }

    public string CreateLongestString(char? character = null)
    {
        return CreateString(LengthEnd ?? LengthStart ?? 0, character ?? CreateCharacter());
    }

    public string CreateString(int length, char? character = null)
    {
        character ??= CreateCharacter();

        return new(character.Value, length);
    }

    // TODO: Make this deal with flags
    private char CreateCharacter()
    {
        // Seeded
        var name = typeof(TEntity).Name;
        var seed = name.Sum(x => x);
        var rnd = new Random(seed);

        return CharacterSet switch
        {
            // Deal with uppercase
            CharacterSet.Alphabetical => (char)rnd.Next('a', 'z'),
            CharacterSet.Numerical => (char)rnd.Next('0', '9'),
            _ => throw new ArgumentOutOfRangeException()
        };
    }
}

[Flags]
public enum CharacterSet
{
    Alphabetical = 0,
    Numerical = 1
}