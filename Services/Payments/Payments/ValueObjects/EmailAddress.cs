using Zoo.Payments.Common;

namespace Zoo.Payments.ValueObjects;

public class EmailAddress : ValueObject
{
    private EmailAddress() { }

    public string Email { get; private set; } = null!;

    public static EmailAddress From(string emailAddress)
    {
        var instance = new EmailAddress
        {
            Email = emailAddress
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Email;
    }
}

public class EmailAddressValidator : AbstractValidator<EmailAddress>
{
    public EmailAddressValidator()
    {
        RuleFor(x => x.Email).NotEmpty().EmailAddress();
    }
}