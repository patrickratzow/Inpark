namespace Zeta.Inpark.Food.Common;

public record DomainEventNotification<TDomainEvent>(
    TDomainEvent DomainEvent
) : INotification where TDomainEvent : DomainEvent;