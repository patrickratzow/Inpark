namespace Zoo.Inpark.Features.Animals.Interfaces;

public interface IContentRepository
{
    ValueTask<Result<string, string>> GetContent();
}