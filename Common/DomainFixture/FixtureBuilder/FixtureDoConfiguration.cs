using System.Linq.Expressions;

namespace DomainFixture.FixtureBuilder;

public class FixtureDoConfiguration<TFixture, TProperty> : IFixtureConfiguration<TFixture>
    where TFixture : class
{
    private readonly Expression<Action<(TFixture Fixture, TProperty Value)>> _actionExpression;
    private readonly Expression<Func<TProperty>> _valueExpression;

    public FixtureDoConfiguration(Expression<Action<(TFixture Fixture, TProperty Value)>> actionExpression,
        Expression<Func<TProperty>> valueExpression)
    {
        _actionExpression = actionExpression;
        _valueExpression = valueExpression;
    }

    public TFixture Apply(TFixture instance)
    {
        var value = _valueExpression.Compile().Invoke();
        var @delegate = _actionExpression.Compile();
        @delegate.Invoke((instance, value));

        return instance;
    }
}