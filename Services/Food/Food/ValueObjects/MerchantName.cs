using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.ValueObjects;

public class MerchantName : ValueObject
{
    public string Value { get; private set; } = null!;
    
    private MerchantName() { }

    public static MerchantName From(string name)
    {
        var instance = new MerchantName
        {
            Value = name
        };
        instance.Validate();
        
        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Value;
    }
}

public class MerchantNameValidator : AbstractValidator<MerchantName>
{
    public MerchantNameValidator()
    {
        RuleFor(x => x.Value)
            .NotEmpty()
            .MaximumLength(255);
    }
}