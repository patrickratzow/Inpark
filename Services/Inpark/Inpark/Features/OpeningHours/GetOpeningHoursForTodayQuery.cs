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
        var value = (int)Enum.Parse(typeof(WeekDay), today.DayOfWeek.ToString());
        var openingHours = await _context.OpeningHours
            .Where(x => 
                x.Range.End.Year >= today.Year &&
                x.Range.End.Month >= today.Month &&
                x.Range.End.Day >= today.Day)
            .Where(x => ((int)x.Days & value) != 0)
            .ToListAsync(cancellationToken);
        
        // Finds the closest start point to today that is not in the future
        return openingHours
            .Where(o =>
            {
                var rangeStart = o.Range.Start;
                var rangeEnd = o.Range.End;
                var dateStart = new DateOnly(rangeStart.Year, rangeStart.Month, rangeStart.Day);
                var dateEnd = new DateOnly(rangeEnd.Year, rangeEnd.Month, rangeEnd.Day);

                // Today should be between dateStart & dateEnd
                return dateStart <= today && dateEnd >= today;
            })
            .OrderByDescending(o => o.Range.Start)
            .Take(1)
            .Select(x => new OpeningHourDto(
                x.Name,
                x.Range.Start,
                x.Range.End,
                x.Open,
                x.Days.ToDays()
            ))
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