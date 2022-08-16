using Azure.Messaging.ServiceBus;

namespace Zoo.Common.Api.EventBus;

public record Subscription(
    ServiceBusReceiver Receiver,
    Action<object> Action
);