namespace Zoo.Inpark.Contracts;

public record AnimalOverview(
    List<Animal> Animals,
    List<string> Categories
);