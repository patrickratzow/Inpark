using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursMapper
{
    public ValueTask<Result<List<OpeningHour>, string>> Parse(string input);
    public OpeningHourDto MapToDto(OpeningHour openingHour);
}