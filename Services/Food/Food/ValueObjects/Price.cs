using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.ValueObjects;

public class Price : ValueObject
{
    private Price() { }

    public long Value { get; private set; }
    
    public static Price From(long cents)
    {
        var instance = new Price
        {
            Value = cents
        };
        instance.Validate();

        return instance;
    }

    public long Subunits => Value;
    public decimal Units => Subunits * 100;

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Value;
    }
}

public class PriceValidator : AbstractValidator<Price>
{
    public PriceValidator()
    {
        RuleFor(x => x.Value).GreaterThanOrEqualTo(0);
    }
}