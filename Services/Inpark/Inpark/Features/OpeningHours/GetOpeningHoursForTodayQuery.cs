using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.OpeningHours;

public record GetOpeningHoursForTodayQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursForTodayQueryHandler 
    : IRequestHandler<GetOpeningHoursForTodayQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly InparkDbContext _context;
    
    public GetOpeningHoursForTodayQueryHandler(InparkDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursForTodayQuery request,
            CancellationToken cancellationToken)
    {
        // 30 min buffer on both sides
        var today = DateTime.Today.AddMinutes(-30);
        var tomorrow = DateTime.Today.AddDays(1).AddMinutes(30);
        var range = TimeRange.From(today, tomorrow);
        var openingHours = await _context.OpeningHours
            .Where(x => x.Range.Start >= range.Start && x.Range.End <= range.End)
            .Select(x => new OpeningHourDto(
                x.Name,
                x.Range.Start,
                x.Range.End,
                x.Open,
                (WeekDayDto)x.Days
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
    [ResponseCache(Duration = 3600)]
    public async partial Task<ActionResult> GetOpeningHoursForToday(CancellationToken cancellationToken)
    {
        var command = new GetOpeningHoursForTodayQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}