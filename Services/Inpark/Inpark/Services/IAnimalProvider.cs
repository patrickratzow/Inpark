using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Services;

public interface IAnimalProvider
{
    public ValueTask<AnimalOverview?> GetOverview();
}