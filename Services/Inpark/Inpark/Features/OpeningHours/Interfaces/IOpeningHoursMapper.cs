using Zeta.Common;
using Zeta.Inpark.Contracts;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Features.OpeningHours.Interfaces;

public interface IOpeningHoursMapper
{
    public ValueTask<Result<List<OpeningHour>, string>> Parse(string input);
    public OpeningHourDto MapToDto(OpeningHour openingHour);
}