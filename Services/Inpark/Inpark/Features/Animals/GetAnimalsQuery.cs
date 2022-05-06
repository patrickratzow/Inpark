using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Features.Animals.Interfaces;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Features.Animals;

public record GetAnimalsQuery : IRequest<OneOf<List<AnimalDto>>>;

public class GetAnimalsHandler : IRequestHandler<GetAnimalsQuery, OneOf<List<AnimalDto>>>
{
    private readonly InparkDbContext _context;
    private readonly IAnimalMapper _mapper;

    public GetAnimalsHandler(InparkDbContext context, IAnimalMapper mapper)
    {
        _context = context;
        _mapper = mapper;
    }

    public async Task<OneOf<List<AnimalDto>>> Handle(GetAnimalsQuery request, CancellationToken cancellationToken)
    {
        var animals = await _context.Animals
            .OrderBy(x => x.Name.Name)
            .ToListAsync(cancellationToken);
        var animalDtos = animals.Select(x => {
            var name = new AnimalNameDto(x.Name.Name, x.Name.LatinName);
            var image = new ImagePairDto(x.Image.PreviewUrl, x.Image.FullscreenUrl);
            var status = (IUCNStatusDto) x.Status;
            if (!_mapper.ParseContent(x.Content).IsSuccess(out var content))
                throw new InvalidDataException("Unable to parse content");

            return new AnimalDto(
                name,
                x.Category,
                image,
                status,
                x.Id.ToString(),
                content!.Select(MapToContentDto).ToList()
            );
        });
    
        return animalDtos.ToList();
    }
    
    private static ContentDto MapToContentDto(IContent content)
    {
        return new(
            content.Value,
            content.Type,
            content.Children.Select(MapToContentDto).ToList()
        );
    }
}

[ApiController]
[MethodGroup(Groups.Animals)]
public partial class GetAnimalsController : ZooController
{
    private readonly IMediator _mediator;

    public GetAnimalsController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Get all animals in the park.
    /// </summary>
    [HttpGet("animals")]
    [ResponseCache(Duration = 43200)]
    public async partial Task<ActionResult> GetAnimals(CancellationToken cancellationToken)
    {
        var command = new GetAnimalsQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}