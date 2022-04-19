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
    //TODO has been outcommented due to errors in Aalborg Zoo's data.
    public TimeRangeValidator()
    {
        RuleFor(x => x.End).NotEmpty();//.GreaterThanOrEqualTo(x => x.Start);
        RuleFor(x => x.Start).NotEmpty(); //.LessThanOrEqualTo(x => x.End);
    }
}
