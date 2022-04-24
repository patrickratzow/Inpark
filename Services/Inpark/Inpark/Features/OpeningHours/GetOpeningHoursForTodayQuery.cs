using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Enums;

namespace Zoo.Inpark.Features.OpeningHours;

public record GetOpeningHoursForTodayQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursForTodayQueryHandler 
    : IRequestHandler<GetOpeningHoursForTodayQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly InparkDbContext _context;
    private readonly IClock _clock;
    
    public GetOpeningHoursForTodayQueryHandler(InparkDbContext context, IClock clock)
    {
        _context = context;
        _clock = clock;
    }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursForTodayQuery request,
        CancellationToken cancellationToken)
    {
        var today = new DateOnly(_clock.Today.Year, _clock.Today.Month, _clock.Today.Day);
        var dateTime = today.ToDateTime(TimeOnly.MinValue);
        var value = (int)Enum.Parse(typeof(WeekDay), today.DayOfWeek.ToString());
        var openingHours = await _context.OpeningHours
            .AsNoTracking()
            .Where(x => 
                x.Range.Start.Date <= dateTime.Date && 
                x.Range.End.Date >= dateTime.Date && 
                ((int)x.Days & value) != 0
            )
            .OrderByDescending(x => x.Range.Start)
            .ToListAsync(cancellationToken);
        
        return openingHours
            .Select(x => new OpeningHourDto(
                x.Name,
                x.Range.Start,
                x.Range.End,
                x.Open,
                x.Days.ToDays()
            ))
            .ToList();
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