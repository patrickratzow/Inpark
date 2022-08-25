using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Common.SDUI;
using Zeta.Inpark.Features.ParkEvents.AalborgZoo;
using Zeta.Inpark.Features.ParkEvents.Interfaces;
using Zoo.Inpark.Contracts;

namespace Zeta.Inpark.Features.ParkEvents;

public record GetParkEventsQuery : IRequest<OneOf<List<ParkEventDto>>>;
public class GetParkEventsQueryQueryHandler :
    IRequestHandler<GetParkEventsQuery, OneOf<List<ParkEventDto>>>
{
    private readonly InparkDbContext _context;
    private readonly IClock _clock;
    private readonly IParkEventMapper _mapper;

    public GetParkEventsQueryQueryHandler(InparkDbContext context, IClock clock, IParkEventMapper mapper)
    {
        _context = context;
        _clock = clock;
        _mapper = mapper;
    }
 
    public async Task<OneOf<List<ParkEventDto>>> Handle(GetParkEventsQuery request, CancellationToken cancellationToken)
    {
        var today = _clock.Today;
        var parkEvents = await _context.ParkEvents
            .Where(x => x.Range.End >= today.Date)
            .OrderBy(x => x.Range.Start)
            .ToListAsync(cancellationToken);

        var parkEventDtos = parkEvents.Select(x =>
        {
            var image = new ImagePairDto(x.Image.PreviewUrl, x.Image.FullscreenUrl);

            var parsedResult = _mapper.ParseContent(x.Content);
            if (!parsedResult.IsSuccess(out var sduiNode))
                throw new InvalidDataException("Unable to parse content. Error: " + parsedResult.AsT1.Value);

            var content = SDUINodeSerializer.Serialize(sduiNode!);
            
            return new ParkEventDto(
                x.Id,
                image,
                x.Title,
                x.Range.Start,
                x.Range.End,
                content
            );
        });

        return parkEventDtos.ToList();
    }
}

[ApiController]
[MethodGroup(Groups.ParkEvents)]
public partial class ParkEventsController : ZooController
{
    private readonly IMediator _mediator;

    public ParkEventsController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Get all events in the park.
    /// </summary>
    [HttpGet("park-events")]
    //[ResponseCache(Duration = 43200)]
    public async partial Task<ActionResult> GetParkEvents(CancellationToken cancellationToken)
    {
        var command = new GetParkEventsQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}


