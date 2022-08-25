using Microsoft.Extensions.DependencyInjection;

namespace Zeta.Inpark.Features.Speaks.AalborgZoo;

public class AalborgZooUpdateSpeaksJob
{
    private readonly IServiceScopeFactory  _scopeFactory;
    
    public AalborgZooUpdateSpeaksJob(IServiceScopeFactory scopeFactory)
    {
        _scopeFactory = scopeFactory;
    }

    public async Task Execute()
    {
        using var scope = _scopeFactory.CreateScope();
        var mediator = scope.ServiceProvider.GetRequiredService<IMediator>();
        var command = new UpdateAalborgZooSpeaksCommand();

        await mediator.Send(command, CancellationToken.None);
    }
}