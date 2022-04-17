namespace Zoo.Common.Api;

public interface IClock
{
    DateTime Now { get; }
    DateTime Today { get; }
    DateTime UtcNow { get; }
}