namespace Zeta.Inpark.Contracts;

public record ParkEventDto(
    Guid Id,
    ImagePairDto Image,
    string Title,
    DateTime Start,
    DateTime End,
    string Content
);

