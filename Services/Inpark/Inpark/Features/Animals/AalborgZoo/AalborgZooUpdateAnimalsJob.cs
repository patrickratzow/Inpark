using Microsoft.Extensions.DependencyInjection;
using Zoo.Inpark.Common;

namespace Zoo.Inpark.Features.Animals;

public class AalborgZooUpdateAnimalsJob : IJob<UpdateAnimalsCommand>
{
    private readonly IServiceScopeFactory  _scopeFactory;
    
    public AalborgZooUpdateAnimalsJob(IServiceScopeFactory scopeFactory)
    {
        _scopeFactory = scopeFactory;
    }

    public async Task Execute()
    {
        using var scope = _scopeFactory.CreateScope();
        var mediator = scope.ServiceProvider.GetRequiredService<IMediator>();
        var command = new UpdateAnimalsCommand();

        await mediator.Send(command, CancellationToken.None);
    }
}
