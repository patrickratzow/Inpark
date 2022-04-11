using Zoo.Inpark.Contracts;
using Zoo.Inpark.Features.Animals.Providers;
using Zoo.Inpark.Services;

namespace Zoo.Inpark.Features.Animals;

public record GetAnimalOverviewQuery : IRequest<OneOf<AnimalOverview>>;

public class GetAnimalOverviewQueryHandler : IRequestHandler<GetAnimalOverviewQuery, OneOf<AnimalOverview>>
{
    private readonly IAnimalProvider _animalProvider;

    public GetAnimalOverviewQueryHandler(IAnimalProvider animalProvider)
    {
        _animalProvider = animalProvider;
    }

    public async Task<OneOf<AnimalOverview>> Handle(GetAnimalOverviewQuery request, CancellationToken cancellationToken)
    {
        var overview = await _animalProvider.GetOverview();
        if (overview is null) throw new Exception("No animals found");
        
        return overview;
    }
}

[ApiController]
[MethodGroup(Groups.Animals)]
public partial class GetAnimalOverviewController : ZooController
{
    private readonly IMediator _mediator;

    public GetAnimalOverviewController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Gets overview of all animals in the park.
    /// </summary>
    [HttpGet("animals/overview")]
    public async partial Task<ActionResult> GetAnimalOverview(CancellationToken cancellationToken)
    {
        var command = new GetAnimalOverviewQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}