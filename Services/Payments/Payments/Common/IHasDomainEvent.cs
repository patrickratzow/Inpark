namespace Zoo.Payments.Common;

public interface IHasDomainEvent
{
    public IReadOnlyList<DomainEvent> DomainEvents { get; }
    public void AddDomainEvent(DomainEvent domainEvent);
}