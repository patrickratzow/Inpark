using System.Linq.Expressions;
using System.Reflection;

namespace DomainFixture.FixtureBuilder;

public class FixtureWithConfiguration<TFixture, TProperty> : IFixtureConfiguration<TFixture>
    where TFixture : class
{
    private readonly Expression<Func<TFixture, TProperty>> _propertyExpression;
    private readonly Expression<Func<TFixture, TProperty>> _valueExpression;

    public FixtureWithConfiguration(Expression<Func<TFixture, TProperty>> propertyExpression,
        Expression<Func<TFixture, TProperty>> valueExpression)
    {
        _propertyExpression = propertyExpression;
        _valueExpression = valueExpression;
    }

    public TFixture Apply(TFixture instance)
    {
        if (_propertyExpression.Body is not MemberExpression memberExpression)
            throw new ArgumentException(nameof(_propertyExpression));

        // Figure out the name automatically if no name is supplied
        var name = memberExpression.Member.Name;
        var property = instance.GetType()
            .GetProperty(name, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
        if (property is null) throw new ArgumentException("Unable to get property", nameof(_propertyExpression));

        var value = GetValue(instance);
        property.SetValue(instance, value);

        return instance;
    }

    private TProperty GetValue(TFixture instance)
    {
        var @delegate = _valueExpression.Compile();
        var value = @delegate.Invoke(instance);

        return value;
    }
}