using MediatR;
using OneOf;

namespace Zeta.Inpark.Maps.Features;

public record PingLocationCommand(
    Guid UserId,
    string Latitude,
    string Longitude
) : IRequest<OneOf<Unit>>;
