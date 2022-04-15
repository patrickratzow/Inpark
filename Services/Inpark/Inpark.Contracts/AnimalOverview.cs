namespace Zoo.Inpark.Contracts;

public record AnimalOverview(
    List<AnimalDto> Animals,
    List<string> Categories
);