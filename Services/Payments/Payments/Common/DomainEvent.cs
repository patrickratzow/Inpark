namespace Zoo.Payments.Common;

public abstract class DomainEvent
{
    protected DomainEvent() { DateOccurred = DateTimeOffset.Now; }

    public bool IsPublished { get; set; }
    public DateTimeOffset DateOccurred { get; protected set; }
}