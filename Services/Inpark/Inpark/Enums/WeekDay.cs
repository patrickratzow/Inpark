namespace Zeta.Inpark.Enums;

[Flags]
public enum WeekDay
{
    None = 0,
    Monday = 1,
    Tuesday = 2,
    Wednesday = 4,
    Thursday = 8,
    Friday = 16,
    Saturday = 32,
    Sunday = 64
};

public static class WeekDayExtensions
{
    public static List<string> ToDays(this WeekDay days)
    {
        var list = new List<string>();
        if (days.HasFlag(WeekDay.Monday)) list.Add("Monday");
        if (days.HasFlag(WeekDay.Tuesday)) list.Add("Tuesday");
        if (days.HasFlag(WeekDay.Wednesday)) list.Add("Wednesday");
        if (days.HasFlag(WeekDay.Thursday)) list.Add("Thursday");
        if (days.HasFlag(WeekDay.Friday)) list.Add("Friday");
        if (days.HasFlag(WeekDay.Saturday)) list.Add("Saturday");
        if (days.HasFlag(WeekDay.Sunday)) list.Add("Sunday");

        return list;
    }

    public static WeekDay ToWeekDay(this IEnumerable<string> days)
    {
        var enumerated = days.ToHashSet();
        var day = WeekDay.None;
        day += enumerated.Contains("Monday") ? (int)WeekDay.Monday : (int)WeekDay.None;
        day += enumerated.Contains("Tuesday") ? (int)WeekDay.Tuesday : (int)WeekDay.None;
        day += enumerated.Contains("Wednesday") ? (int)WeekDay.Wednesday : (int)WeekDay.None;
        day += enumerated.Contains("Thursday") ? (int)WeekDay.Thursday : (int)WeekDay.None;
        day += enumerated.Contains("Friday") ? (int)WeekDay.Friday : (int)WeekDay.None;
        day += enumerated.Contains("Saturday") ? (int)WeekDay.Saturday : (int)WeekDay.None;
        day += enumerated.Contains("Sunday") ? (int)WeekDay.Sunday : (int)WeekDay.None;

        return day;
    }
}

