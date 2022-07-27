namespace Zeta.Inpark.Auth.ValueObjects;

public class EmailAddress : ValueObject
{
    public string Value { get; private set; }
    
    private EmailAddress() { }
    
    public static EmailAddress From(string email)
    {
        var instance = new EmailAddress
        {
            Value = email
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Value;
    }
}

public class EmailAddressValidator : AbstractValidator<EmailAddress>
{
    public EmailAddressValidator()
    {
        RuleFor(x => x.Value)
            .NotEmpty()
            .EmailAddress();
    }
}