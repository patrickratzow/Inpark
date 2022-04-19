namespace Zoo.Inpark.Extensions;

public static class DateTimeOffsetExtensions
{
    public static DateTimeOffset ToTimeZoneOffset(this DateTimeOffset dateTime, TimeZoneInfo timeZone)
    {
        var baseOffset = timeZone.BaseUtcOffset;
        var isDst = timeZone.IsDaylightSavingTime(dateTime);
        
        return dateTime.ToOffset(baseOffset + (isDst ? TimeSpan.FromHours(1) : TimeSpan.Zero));
    }
}