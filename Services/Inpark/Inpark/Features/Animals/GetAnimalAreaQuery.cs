using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Errors;
using Zoo.Inpark.Contracts;

namespace Zeta.Inpark.Features.Animals;


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
                
                var pointsArray = new double[points.Count * 2];
                for (var i = 0; i < points.Count; i++)
                {
                    var pos = i * 2;
                    var point = points[i];
                    pointsArray[pos] = point.X;
                    pointsArray[pos + 1] = point.Y;
                }
                
                return new AnimalAreaDto(
                    color,
                    pointsArray
                );
            }).ToList();
    }
}

public class GetAnimalAreaQueryValidator : AbstractValidator<GetAnimalAreaQuery>
{
    public GetAnimalAreaQueryValidator()
    {
        RuleFor(x => x.LatinName).NotEmpty().MaximumLength(512);
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
    [HttpGet("animals/{latinName}/areas")]
    public async partial Task<ActionResult> GetAnimalAreas([FromRoute] string latinName, CancellationToken cancellationToken)
    {
        var command = new GetAnimalAreaQuery(latinName);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}


