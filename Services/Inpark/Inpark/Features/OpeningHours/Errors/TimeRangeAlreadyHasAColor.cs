namespace Zoo.Inpark.Features.OpeningHours.Errors;

public record TimeRangeAlreadyHasAColor(string TimeRange) : IAlreadyExistsError
{
    public string ErrorMessage => $"The time range {TimeRange} already has a color";
}