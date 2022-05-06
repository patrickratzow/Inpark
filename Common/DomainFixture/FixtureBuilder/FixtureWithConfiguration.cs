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

        var accessors = new List<string> { memberExpression.Member.Name };
        var expression = memberExpression;
        while (expression.Expression is MemberExpression childExpression)
        {
            accessors.Add(childExpression.Member.Name);
            expression = childExpression;
        }
        // The accessors are in reverse order, so we need to reverse them
        accessors.Reverse();

        object obj = instance;
        PropertyInfo property = null!;
        for (var i = 0; i < accessors.Count; i++)
        {
            var accessor = accessors[i];
            var temp = obj;
            property = temp.GetType().GetProperty(accessor,
                           BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)
                       ?? throw new InvalidOperationException();
            
            // Dont set for last
            if (i < accessors.Count - 1)
            {
                obj = property.GetValue(obj) ?? throw new InvalidOperationException();
            }
        }

        if (obj is null) throw new ArgumentException("Unable to get property", nameof(_propertyExpression));

        var value = GetValue(instance);
        property!.SetValue(obj, value);

        return instance;
    }

    private TProperty GetValue(TFixture instance)
    {
        var @delegate = _valueExpression.Compile();
        var value = @delegate.Invoke(instance);

        return value;
    }
}