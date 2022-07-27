using Microsoft.Extensions.Logging;

namespace Zeta.Inpark.Auth.Common;

public class DomainEventService
{
    private readonly ILogger<DomainEventService> _logger;
    private readonly IPublisher _mediator;

    public DomainEventService(ILogger<DomainEventService> logger, IPublisher mediator)
    {
        _logger = logger;
        _mediator = mediator;
    }

    public async Task Publish(DomainEvent domainEvent)
    {
        if (domainEvent.IsPublished)
        {
            _logger.LogWarning("Domain event {DomainEvent} is already published", domainEvent.GetType().Name);

            return;
        }
        
        _logger.LogInformation(
            "Publishing domain event. Event - {Event} with the contents {Contents}", 
            domainEvent.GetType().Name,
            domainEvent.ToString()
        );
        domainEvent.Publish();
        
        await _mediator.Publish(GetNotificationCorrespondingToDomainEvent(domainEvent));
    }

    private static INotification GetNotificationCorrespondingToDomainEvent(DomainEvent domainEvent)
    {
        return (INotification)Activator.CreateInstance(
            typeof(DomainEventNotification<>).MakeGenericType(domainEvent.GetType()),
            domainEvent
        )!;
    }
}