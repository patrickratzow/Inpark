namespace Zeta.Inpark.Auth.Common;

public record DomainEventNotification<TDomainEvent>(
    TDomainEvent DomainEvent
) : INotification where TDomainEvent : DomainEvent;