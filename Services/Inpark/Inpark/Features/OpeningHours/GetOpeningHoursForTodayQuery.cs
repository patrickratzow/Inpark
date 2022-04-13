using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Features.OpeningHours;

public record GetOpeningHoursForTodayQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursForTodayQueryHandler 
    : IRequestHandler<GetOpeningHoursForTodayQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly InparkDbContext _context;

    public GetOpeningHoursForTodayQueryHandler(InparkDbContext context) { _context = context; }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursForTodayQuery request,
            CancellationToken cancellationToken)
    {
        var today = (DateTimeOffset)DateOnly.FromDateTime(DateTime.Now).ToDateTime(TimeOnly.MinValue);
        var tomorrow = today.AddDays(1);
        var openingHours = await _context.OpeningHours
            .Where(x => x.Range.Start >= today && x.Range.End <= tomorrow)
            .Select(x => new OpeningHourDto(
                x.Name,
                x.Range.Start,
                x.Range.End,
                x.Open
            ))
            .ToListAsync(cancellationToken);

        return openingHours;
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
    public async partial Task<ActionResult> GetOpeningHoursForToday(CancellationToken cancellationToken)
    {
        var command = new GetOpeningHoursForTodayQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}