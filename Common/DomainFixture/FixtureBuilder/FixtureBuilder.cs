using System.Linq.Expressions;
using System.Reflection;

namespace DomainFixture.FixtureBuilder;

public class FixtureBuilder<TFixture>
    where TFixture : class
{
    private readonly List<IFixtureConfiguration<TFixture>> _configurations = new();
    private bool _reuseFixtures;

    public FixtureBuilder<TFixture> With<TProperty>(
        Expression<Func<TFixture, TProperty>> propertyExpression,
        Expression<Func<TFixture, TProperty>> value)
    {
        var withConfiguration = new FixtureWithConfiguration<TFixture, TProperty>(propertyExpression, value);
        _configurations.Add(withConfiguration);

        return this;
    }

    public FixtureBuilder<TFixture> With<TProperty>(
        Expression<Func<TFixture, TProperty>> propertyExpression,
        TProperty value)
        => With(propertyExpression, x => value);

    public FixtureBuilder<TFixture> WithMany<TProperty>(
        Expression<Func<TFixture, IEnumerable<TProperty>>> propertyExpression,
        int count)
        where TProperty : class
    {
        var values = Fixture.Valid<TProperty>().CreateMany(count);

        return With(propertyExpression, values);
    }

    public FixtureBuilder<TFixture> Do<TProperty>(
        Expression<Action<(TFixture Fixture, TProperty Value)>> actionExpression,
        Expression<Func<TProperty>> value)
    {
        var doConfiguration = new FixtureDoConfiguration<TFixture, TProperty>(actionExpression, value);
        _configurations.Add(doConfiguration);

        return this;
    }

    public FixtureBuilder<TFixture> Do<TProperty>(
        Expression<Action<(TFixture Fixture, TProperty Value)>> actionExpression,
        TProperty value)
    {
        Expression<Func<TProperty>> valueExpression = () => value;

        return Do(actionExpression, valueExpression);
    }

    public FixtureBuilder<TFixture> DoMany<TProperty>(
        Expression<Action<(TFixture Fixture, TProperty Value)>> actionExpression,
        IEnumerable<TProperty> values)
    {
        foreach (var value in values)
        {
            Do(actionExpression, () => value);
        }

        return this;
    }

    public FixtureBuilder<TFixture> DoMany<TProperty>(
        Expression<Action<(TFixture Fixture, TProperty Value)>> actionExpression,
        int count)
        where TProperty : class
    {
        for (var i = 0; i < count; i++)
        {
            Do(actionExpression, () => Fixture.Valid<TProperty>().Create());
        }

        return this;
    }

    public FixtureBuilder<TFixture> ReuseFixtures()
    {
        _reuseFixtures = true;

        return this;
    }

    public TFixture Create()
    {
        var instance = (TFixture)EntityTestSource.CreateValidEntity(typeof(TFixture))!;

        ApplyConfiguration(instance);

        return instance;
    }

    public List<TFixture> CreateMany(int count = 3)
    {
        if (count <= 0) throw new ArgumentOutOfRangeException(nameof(count), "Must be greater than 0");
        if (!_reuseFixtures)
            return Enumerable.Range(0, count).Select(_ => Create()).ToList();

        var fixture = Create();
        // Get properties that are fixtures
        var properties = fixture.GetType()
            .GetProperties(BindingFlags.Instance | BindingFlags.Public |
                           BindingFlags.NonPublic | BindingFlags.GetProperty |
                           BindingFlags.SetProperty)
            .Where(p => p.CanRead && p.CanWrite)
            .Where(p => IsDerivedOfGenericType(p.PropertyType, typeof(IEnumerable<>))
                ? IsFixture(p.PropertyType.GenericTypeArguments.First())
                : IsFixture(p.PropertyType))
            .ToList();
        // Apply the property values using With
        foreach (var property in properties)
        {
            var fixtureParameter = Expression.Parameter(typeof(TFixture), "x");
            var memberExpression = Expression.MakeMemberAccess(fixtureParameter, property);
            var propertyLambda = Expression.Lambda<Func<TFixture, object?>>(memberExpression, fixtureParameter);

            With(propertyLambda, property.GetValue(fixture));
        }

        return Enumerable.Range(0, count - 1)
            .Select(_ => Create())
            .Prepend(fixture)
            .ToList();
    }

    private void ApplyConfiguration(TFixture instance)
    {
        foreach (var configuration in _configurations)
        {
            configuration.Apply(instance);
        }
    }

    private static bool IsFixture(Type type)
        => FluentTests.Bases.Any(b => type.IsAssignableTo(b) || type.IsSubclassOf(b));

    private static bool IsDerivedOfGenericType(Type type, Type genericType)
    {
        if (type.IsGenericType && type.GetGenericTypeDefinition() == genericType)
        {
            return true;
        }

        return type.BaseType is not null && IsDerivedOfGenericType(type.BaseType, genericType);
    }
}