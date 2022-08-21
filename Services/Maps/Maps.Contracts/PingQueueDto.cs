namespace Zeta.Inpark.Maps.Contracts;

public record PingQueueDto(
    Guid PingId,
    Guid UserId,
    double Latitude,
    double Longitude
);
