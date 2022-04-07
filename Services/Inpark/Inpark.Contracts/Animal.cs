namespace Zoo.Inpark.Contracts;

public record Animal(
    AnimalName Name,
    string Category,
    AnimalImage Image,
    string Id,
    List<AnimalContent> Contents
);

public record AnimalName(
    string DisplayName,
    string LatinName
);

public record AnimalImage
(
    string PreviewUrl,
    string FullscreenUrl
);

public record AnimalContent(
    string Text, 
    string Type
);

