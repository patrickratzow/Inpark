using Zeta.Inpark.Entities;
using Zoo.Inpark.Contracts;

namespace Zeta.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursMapper
{
    public ValueTask<Result<List<OpeningHour>, string>> Parse(string input);
    public OpeningHourDto MapToDto(OpeningHour openingHour);
}