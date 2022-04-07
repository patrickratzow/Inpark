using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Features.Animals.Providers;

public interface IAnimalProvider
{
    public ValueTask<AnimalOverview?> GetOverview();
    public ValueTask<Animal?> GetAnimal(string id);
}