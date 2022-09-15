using Zeta.Common;

namespace Zeta.Inpark.Features.Animals.Interfaces;

public interface IAnimalRepository
{
    ValueTask<Result<string, string>> GetContent();
}