using Azure.Messaging.ServiceBus;

namespace Zeta.Common.Api.EventBus;

public record Subscription(
    ServiceBusReceiver Receiver,
    Action<object> Action
);