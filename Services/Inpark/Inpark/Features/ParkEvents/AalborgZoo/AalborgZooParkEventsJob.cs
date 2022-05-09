using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.Features.Events.AalborgZoo;

public class AalborgZooParkEventsJob : IJob<UpdateAalborgZooParkEventsCommand>
{
    private readonly IServiceScopeFactory _scopeFactory;

    public AalborgZooParkEventsJob(IServiceScopeFactory scopeFactory)
    {
        _scopeFactory = scopeFactory;
    }

    public async Task Execute()
    {
        using var scope = _scopeFactory.CreateScope();
        var mediator = scope.ServiceProvider.GetRequiredService<IMediator>();
        var command = new UpdateAalborgZooParkEventsCommand();

        await mediator.Send(command, CancellationToken.None);
    }
}

