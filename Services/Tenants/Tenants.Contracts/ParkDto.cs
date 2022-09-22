namespace Zeta.Inpark.Tenants.Contracts;

public record ParkDto(
    string Name,
    string ImageUrl,
    AddressDto Address,
    GpsLocationDto GpsLocation
);