using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Inpark.Common;
using Zoo.Inpark.Enums;

namespace Zoo.Inpark.ValueObjects;

public class SpeakTime : ValueObject
{
    private SpeakTime() { }
    
    public string Title { get; private set; } = null!;
    public WeekDay Day { get; private set; }
    public TimeRange Range { get; private set; } = null!;

    public static SpeakTime From(string title, WeekDay day, TimeRange range)
    {
        var instance = new SpeakTime()
        {
            Title = title,
            Day = day,
            Range = range
        };
        instance.Validate();

        return instance;
    }
    
    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Title;
        yield return Day;
        yield return Range;
    }
}

public class SpeakTimeValidator : AbstractValidator<SpeakTime>
{
    public SpeakTimeValidator()
    {
        RuleFor(x => x.Title).NotEmpty();
        RuleFor(x => x.Day).IsInEnum();
        RuleFor(x => x.Range).NotNull();
    }
}