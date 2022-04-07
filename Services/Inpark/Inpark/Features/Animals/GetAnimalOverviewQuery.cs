using Zoo.Inpark.Contracts;
using Zoo.Inpark.Features.Animals.Providers;

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

        return new AnimalOverview(
            new List<Animal>()
            {
                new Animal(
                    new AnimalName("Vaskebjørn", "floppa"),
                    "Pattedyr",
                    new AnimalImage(
                        "https://i.imgur.com/l1gHaaf.jpeg",
                        "https://i.imgur.com/l1gHaaf.jpeg"
                    ),
                    "/vores-dyr/vaskebjørn"
                ),
                new Animal(
                    new AnimalName("Big Floppa", "The Flopster"),
                    "Pattedyr",
                    new AnimalImage(
                        "https://i.imgur.com/l1gHaaf.jpeg",
                        "https://i.imgur.com/l1gHaaf.jpeg"
                    ),
                    "/vores-dyr/floppa"
                )
            },
            new List<string>()
            {
                "Pattedyr"
            }
        );
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