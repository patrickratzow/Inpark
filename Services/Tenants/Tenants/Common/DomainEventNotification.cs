using MediatR;

namespace Zeta.Inpark.Tenants.Common;

public record DomainEventNotification<TDomainEvent>(
    TDomainEvent DomainEvent
) : INotification where TDomainEvent : DomainEvent;