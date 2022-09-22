using FluentValidation;
using Zeta.Inpark.Tenants.Common;

namespace Zeta.Inpark.Tenants.ValueObjects;

public class Address : ValueObject
{
    public string Street { get; private set; } = null!;
    public int Number { get; private set; }
    public string ZipCode { get; private set; }
    public string City { get; private set; } = null!;

    private Address() {}

    public static Address From(string street, int number, string zipCode, string city)
    {
        var instance = new Address()
        {
            Street = street,
            Number = number,
            ZipCode = zipCode,
            City = city
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Street;
        yield return Number;
        yield return ZipCode;
        yield return City;
    }
}

public class AddressValidator : AbstractValidator<Address>
{
    public AddressValidator()
    {
        RuleFor(x => x.Street).NotEmpty();
        RuleFor(x => x.Number).GreaterThan(0);
        RuleFor(x => x.ZipCode).NotEmpty()
            .Must(x => int.TryParse(x, out _)).WithMessage("Not a valid zip code. Must be [0-9]{4}")
            .Length(4);
        RuleFor(x => x.City).NotEmpty().MaximumLength(255);
    }
}