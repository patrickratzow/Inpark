using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.ValueObjects;

public class CvrNumber : ValueObject
{
    public string Value { get; private set; } = null!;
    
    private CvrNumber() { }

    public static CvrNumber From(string cvrNumber)
    {
        var instance = new CvrNumber
        {
            Value = cvrNumber
        };
        instance.Validate();
        
        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Value;
    }
}

public class CvrNumberValidator : AbstractValidator<CvrNumber>
{
    public CvrNumberValidator()
    {
        RuleFor(x => x.Value)
            .NotEmpty()
            .Length(8)
            .Matches(@"^\d+$");
    }
}