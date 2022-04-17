using System.Linq.Expressions;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.ValueObjects;

public class TimeRange : ValueObject
{
    private TimeRange() { }

    public DateTimeOffset Start { get; private set; }
    public DateTimeOffset End { get; private set; }

    public static TimeRange From(DateTimeOffset start, DateTimeOffset end)
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
        RuleFor(x => x.End).NotEmpty().GreaterThan(x => x.Start);
        RuleFor(x => x.Start).NotEmpty().LessThan(x => x.End);
    }
}
