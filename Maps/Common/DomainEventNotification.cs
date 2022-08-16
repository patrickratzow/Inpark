using MediatR;

namespace Zeta.Inpark.Maps.Common;

public record DomainEventNotification<TDomainEvent>(
    TDomainEvent DomainEvent
) : INotification where TDomainEvent : DomainEvent;