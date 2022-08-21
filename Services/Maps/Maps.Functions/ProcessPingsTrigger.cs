using MediatR;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Maps.Contracts;
using Zeta.Inpark.Maps.Features;

namespace Zeta.Inpark.Maps.Functions;

public class ProcessPingsTrigger
{
    private readonly IMediator _mediator;

    public ProcessPingsTrigger(IMediator mediator)
    {
        _mediator = mediator;
    }

    [Function("process-pings-trigger")]
    public async Task Run(
        [QueueTrigger("pings", Connection = "QUEUE_CONNECTION")] PingQueueDto ping,
        FunctionContext context)
    {
        var logger = context.GetLogger("process-pings-trigger");
        logger.LogInformation("C# Queue trigger function processed: {Ping}", ping);

        var command = new ProcessPingLocation.Command(
            ping.PingId,
            ping.UserId,
            ping.Latitude,
            ping.Longitude
        );

        await _mediator.Send(command);
    }
}