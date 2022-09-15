namespace Zeta.Common.Api.EventBus;

public interface IEventBus
{
    Task Publish<T>(string queue, T @event);
    Task Subscribe(string queue, Action<object> action);
}