using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursMapper
{
    public Result<List<OpeningHour>, string> Parse(string input);
}