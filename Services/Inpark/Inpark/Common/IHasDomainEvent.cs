using Zoo.Payments.Common;

namespace Zoo.Inpark.Common;

public interface IHasDomainEvent
{
    public IReadOnlyList<DomainEvent> DomainEvents { get; }
    public void AddDomainEvent(DomainEvent domainEvent);
}