using Zoo.Inpark.Entities;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursRepository
{
    public ValueTask<Result<string, string>> GetRange(TimeRange range);
    public ValueTask<List<OpeningHour>> GetDate(DateOnly date);
    public ValueTask<List<OpeningHour>> GetAll();
}