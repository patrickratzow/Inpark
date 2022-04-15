namespace Zoo.Inpark.Common;

public record DomainEventNotification<TDomainEvent>(
    TDomainEvent DomainEvent
) : INotification where TDomainEvent : DomainEvent;