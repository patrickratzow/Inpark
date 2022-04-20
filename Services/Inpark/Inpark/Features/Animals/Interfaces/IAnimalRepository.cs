namespace Zoo.Inpark.Features.Animals.Interfaces;

public interface IAnimalRepository
{
    ValueTask<Result<string, string>> GetContent();
}