using Zeta.Inpark.Entities;
using Zeta.Inpark.Models;

namespace Zeta.Inpark.Features.Animals.Interfaces;

public interface IAnimalMapper
{
    Result<List<Animal>, string> ParseAnimalOverview(string input);
    Result<List<IContent>, string> ParseContent(string content);
}