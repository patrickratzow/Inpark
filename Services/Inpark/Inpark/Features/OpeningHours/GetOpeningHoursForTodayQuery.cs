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
        var today = _clock.Today;
        var day = new DateTime(today.Year, today.Month, today.Day);
        var openingHours = await _context.OpeningHours
            .Where(x => 
                x.Range.Start.Year <= day.Year &&
                x.Range.Start.Month <= day.Month &&
                x.Range.Start.Day <= day.Day &&
                x.Range.End.Year >= day.Year &&
                x.Range.End.Month >= day.Month &&
                x.Range.End.Day >= day.Day)
            .ToListAsync(cancellationToken);
        
        // Finds the closest start point to today that is not in the future
        var closest = openingHours
            .GroupBy(x => new DateTime(x.Range.Start.Year, x.Range.Start.Month, x.Range.Start.Day))
            .Select(x => new
            {
                Date = x.Key,
                Grouping = x,
                DayDifference = (today - x.Key).TotalDays
            })
            .Where(x => x.DayDifference >= 0)
            .OrderBy(x => x.DayDifference)
            .Select(x => x.Grouping)
            .FirstOrDefault();
        // Map to DTO
        var result = closest?
            .Select(x => new OpeningHourDto(
                x.Name,
                x.Range.Start,
                x.Range.End,
                x.Open,
                x.Days.ToDays()
            ));
        // Filter out if day isn't today
        var todayOpeningHours = result?
            .Where(x => x.Days.Contains(today.DayOfWeek.ToString()))
            .ToList();

        return todayOpeningHours ?? new List<OpeningHourDto>();
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