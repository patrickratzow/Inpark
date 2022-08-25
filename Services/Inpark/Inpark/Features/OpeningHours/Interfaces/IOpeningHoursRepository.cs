using Zeta.Inpark.Entities;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursRepository
{
    public ValueTask<Result<string, string>> GetRange(TimeRange range);
    public ValueTask<List<OpeningHour>> GetDate(DateOnly date);
    public ValueTask<List<OpeningHour>> GetAll();
}