using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.Speaks.Interfaces;

public interface ISpeaksMapper
{
    public Result<List<Speak>, string> Parse(string input);
}