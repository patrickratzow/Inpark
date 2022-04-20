using System.Linq.Expressions;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.ValueObjects;

public class TimeRange : ValueObject
{
    private TimeRange() { }

    public DateTime Start { get; private set; }
    public DateTime End { get; private set; }

    public static TimeRange From(DateTime start, DateTime end)
    {
        var instance = new TimeRange
        {
            Start = start,
            End = end
        };
        instance.Validate();

        return instance;
    }

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Start;
        yield return End;
    }

    public override string ToString() => $"{Start}-{End}";
}

public class TimeRangeValidator : AbstractValidator<TimeRange>
{
    public TimeRangeValidator()
    {
        RuleFor(x => x.Start).NotEmpty();
        RuleFor(x => x.End).NotEmpty();
        RuleFor(x => x).Must(x =>
        {
            var start = new DateOnly(x.Start.Year, x.Start.Month, x.Start.Day);
            var end = new DateOnly(x.End.Year, x.End.Month, x.End.Day);

            return end >= start;
        });
    }
}