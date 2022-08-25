using Zeta.Inpark.Features.OpeningHours.Interfaces;
using Zoo.Inpark.Contracts;

namespace Zeta.Inpark.Features.OpeningHours;

public record GetOpeningHoursForTodayQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursForTodayQueryHandler 
    : IRequestHandler<GetOpeningHoursForTodayQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly IOpeningHoursRepository _repository;
    private readonly IOpeningHoursMapper _mapper;
    private readonly IClock _clock;

    public GetOpeningHoursForTodayQueryHandler(IOpeningHoursRepository repository, IOpeningHoursMapper mapper, 
        IClock clock)
    {
        _repository = repository;
        _mapper = mapper;
        _clock = clock;
    }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursForTodayQuery request,
        CancellationToken cancellationToken)
    {
        var today = new DateOnly(_clock.Today.Year, _clock.Today.Month, _clock.Today.Day);
        var openingHours = await _repository.GetDate(today);
        
        return openingHours
            .Select(_mapper.MapToDto)
            .ToList();
    }
}

[ApiController]
[MethodGroup(Groups.OpeningHours)]
public partial class GetOpeningHoursTorTodayController : ZooController
{
    private readonly IMediator _mediator;

    public GetOpeningHoursTorTodayController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Gets today's opening hours
    /// </summary>
    [HttpGet("opening-hours/today")]
    [ResponseCache(Duration = 3600)]
    public async partial Task<ActionResult> GetOpeningHoursForToday(CancellationToken cancellationToken)
    {
        var command = new GetOpeningHoursForTodayQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}