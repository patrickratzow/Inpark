namespace Zoo.Inpark.Contracts;

public record Animal(
    AnimalName Name,
    string Category,
    AnimalImage Image,
    string Id,
    List<ContentDto> Contents
);