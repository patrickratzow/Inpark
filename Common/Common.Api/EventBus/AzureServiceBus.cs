using System.Text.Json;
using Azure.Messaging.ServiceBus;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace Zoo.Common.Api.EventBus;

public class AzureServiceBus : IEventBus
{
    private readonly ServiceBusClient _client;
    private readonly ILogger<AzureServiceBus> _logger;
    private readonly Dictionary<string, Subscription> _subscriptions = new();

    public AzureServiceBus(IConfiguration configuration, ILogger<AzureServiceBus> logger)
    {
        var connectionString = configuration.GetConnectionString("AzureServiceBus");

        _client = new(connectionString);
        _logger = logger;
    }

    public async Task Publish<T>(string queue, T @event)
    {
        var sender = _client.CreateSender(queue);
        using var batch = await sender.CreateMessageBatchAsync();
        var serializedEvent = JsonSerializer.Serialize(@event);
        
        _logger.LogInformation(
            "Publishing a message to Azure Service Bus queue {Queue} with the contents {Contents}", 
            queue, 
            serializedEvent
        );

        var message = new ServiceBusMessage(serializedEvent);
        if (!batch.TryAddMessage(message))
        {
            _logger.LogCritical("Failed to publish message");
        }
        
        await sender.SendMessagesAsync(batch);
        
        _logger.LogInformation("Message published");
    }

    public async Task Subscribe(string queue, Action<object> action)
    {
        if (!_subscriptions.TryGetValue(queue, out var subscription)) 
        {
            subscription = new(
                _client.CreateReceiver(queue),
                action
            );
            _subscriptions.Add(queue, subscription);
        }
        
        var message = await subscription.Receiver.ReceiveMessageAsync();
        
        
    }
}