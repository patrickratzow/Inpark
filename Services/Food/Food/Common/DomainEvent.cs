namespace Zeta.Inpark.Food.Common;

public abstract record DomainEvent
{
    public bool IsPublished { get; private set; }
    public DateTimeOffset DateOccurred { get; private set; } = DateTimeOffset.Now;

    public void Publish()
    {
        if (IsPublished) throw new InvalidOperationException("Cannot publish twice");
        
        DateOccurred = DateTimeOffset.Now;
        IsPublished = true;
    }
}