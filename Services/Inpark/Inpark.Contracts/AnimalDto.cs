namespace Zoo.Inpark.Contracts;

public enum IUCNStatusDto
{
    Unknown, EX, EW, CR, EN, VU, NT, LC
}

public record AnimalDto(
    AnimalNameDto Name,
    string Category,
    ImagePairDto Image,
    IUCNStatusDto Status,
    string Id,
    List<ContentDto> Contents
);