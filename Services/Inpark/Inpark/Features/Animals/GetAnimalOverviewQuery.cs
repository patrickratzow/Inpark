using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Models;
using Zoo.Inpark.Services;

namespace Zoo.Inpark.Features.Animals;

public record GetAnimalOverviewQuery : IRequest<OneOf<List<AnimalDto>>>;

public class GetAnimalOverviewQueryHandler : IRequestHandler<GetAnimalOverviewQuery, OneOf<List<AnimalDto>>>
{
    private readonly InparkDbContext _context;
    private readonly IAalborgZooAnimalContentMapper _mapper;
    private readonly IMemoryCache _cache;


    public GetAnimalOverviewQueryHandler(InparkDbContext context, IAalborgZooAnimalContentMapper mapper, IMemoryCache cache)
    {
        _context = context;
        _mapper = mapper;
        _cache = cache;
    }

    public async Task<OneOf<List<AnimalDto>>> Handle(GetAnimalOverviewQuery request, CancellationToken cancellationToken)
    {
        return await _cache.GetOrCreateAsync("animals_overview", async (entry) =>
        {
            entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromHours(1);
            var overview = await _context.Animals.OrderBy(x => x.Name.Name).ToListAsync(cancellationToken);
            var dtos = overview.Select(x => new AnimalDto(
                new AnimalNameDto(x.Name.Name, x.Name.LatinName),
                x.Category,
                new AnimalImageDto(x.Image.PreviewUrl, x.Image.FullscreenUrl),
                (IUCNStatusDto) x.Status,
                x.Id.ToString(),
                //TODO Fix later on
                _mapper.ParseContent(x.Content).AsT0.Value.Select(MapToContentDto).ToList()
            ));
        
            return dtos.ToList();
        });
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