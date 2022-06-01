using Zoo.Inpark.Contents;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Features.Animals.Interfaces;

public interface IAnimalMapper
{
    Result<List<Animal>, string> ParseAnimalOverview(string input);
    Result<ContentElement, string> ParseContent(string content);
}