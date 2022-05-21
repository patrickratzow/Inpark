using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Features.Animals;


public record GetAnimalAreaQuery(string LatinName) : IRequest<OneOf<List<AnimalAreaDto>, AnimalNotFound>>;

public class GetAnimalAreaQueryHandler : IRequestHandler<GetAnimalAreaQuery, OneOf<List<AnimalAreaDto>, AnimalNotFound>>
{
    private readonly InparkDbContext _context;

    public GetAnimalAreaQueryHandler(InparkDbContext context)
    {
        _context = context;
    }

    //Get all areas for an animal with points
    public async Task<OneOf<List<AnimalAreaDto>, AnimalNotFound>> Handle(GetAnimalAreaQuery request, CancellationToken cancellationToken)
    {
        var animal = await _context.Animals
            .FirstOrDefaultAsync(x => x.Name.LatinName == request.LatinName, cancellationToken);

        if (animal is null) return new AnimalNotFound(request.LatinName);

        return animal.Areas
            .Select(area =>
            {
                var color = area.Color;
                var points = area.Points;

                var pointsDto = points.Select(p =>

                    new PointDto(
                        p.X,
                        p.Y
                    )
                ).ToList();

                return new AnimalAreaDto(
                    color,
                    pointsDto
                );
            }).ToList();
    }
}

[ApiController]
[MethodGroup(Groups.Animals)]
public partial class GetAnimalAreaController : ZooController
{
    private readonly IMediator _mediator;

    public GetAnimalAreaController(IMediator mediator)
    {
        _mediator = mediator;
    }
    
    /// <summary>
    /// Get an animals areas in the park.
    /// </summary>
    [HttpGet("{latinName}/areas")]
    public async partial Task<ActionResult> GetAnimalAreas([FromRoute] string latinName, CancellationToken cancellationToken)
    {
        var command = new GetAnimalAreaQuery(latinName);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}


