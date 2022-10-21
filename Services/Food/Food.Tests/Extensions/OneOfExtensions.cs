using FluentAssertions.Primitives;
using OneOf;

namespace Zeta.Inpark.Food.Tests.Extensions;

public static class OneOfExtensions
{
    public static OneOfAssertions Should(this IOneOf oneOf)
    {
        return new(oneOf.Value);
    }
}

public class OneOfAssertions : ReferenceTypeAssertions<object, OneOfAssertions>
{
    public OneOfAssertions(object subject) : base(subject)
    {
    }

    protected override string Identifier => "oneOf";
    
    
    public TTo BeOfType<TTo>(string because = "", params object[] becauseArgs)
    {
        BeOfType(typeof(TTo), because, becauseArgs);

        return (Subject is TTo to ? to : default)!;
    }
}