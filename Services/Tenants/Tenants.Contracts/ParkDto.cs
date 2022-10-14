namespace Zeta.Inpark.Tenants.Contracts;

public record ParkDto(
    Guid Id,
    string Name,
    string ImageUrl,
    AddressDto Address,
    GpsLocationDto GpsLocation
);