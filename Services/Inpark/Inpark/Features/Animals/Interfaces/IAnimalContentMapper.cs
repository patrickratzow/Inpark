using Zoo.Inpark.Entities;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Features.Animals.Interfaces;

public interface IAnimalContentMapper
{
    Result<List<Animal>, string> ParseAnimalOverview(string input);
    Result<List<IContent>, string> ParseContent(string content);
}