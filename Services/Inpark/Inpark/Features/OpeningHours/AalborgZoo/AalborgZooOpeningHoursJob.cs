using Microsoft.Extensions.DependencyInjection;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.Features.OpeningHours.AalborgZoo;

public class AalborgZooOpeningHoursJob : IJob<UpdateAalborgZooOpeningHoursCommand>
{
    private readonly IServiceScopeFactory  _scopeFactory;
    
    public AalborgZooOpeningHoursJob(IServiceScopeFactory scopeFactory)
    {
        _scopeFactory = scopeFactory;
    }

    public async Task Execute()
    {
        using var scope = _scopeFactory.CreateScope();
        var mediator = scope.ServiceProvider.GetRequiredService<IMediator>();
        var command = new UpdateAalborgZooOpeningHoursCommand();

        await mediator.Send(command, CancellationToken.None);
    }
}
