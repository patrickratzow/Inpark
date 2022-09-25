namespace Zeta.Inpark.Tenants.Contracts;

public record AddressDto(
    string Street,
    int Number,
    string Zipcode,
    string City
);