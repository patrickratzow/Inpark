using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursRepository
{
    public ValueTask<Result<string, string>> GetRange(TimeRange range);
}