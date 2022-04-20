using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Enums;

namespace Zoo.Inpark.Features.Speaks;

public record GetAnimalSpeaksForTodayQuery : IRequest<OneOf<List<SpeakDto>>>;

public class GetAnimalSpeaksForTodayQueryHandler :
    IRequestHandler<GetAnimalSpeaksForTodayQuery, OneOf<List<SpeakDto>>>
{
    private readonly InparkDbContext _context;
    private readonly IClock _clock;

    public GetAnimalSpeaksForTodayQueryHandler(InparkDbContext context, IClock clock)
    {
        _context = context;
        _clock = clock;
    }

    public async Task<OneOf<List<SpeakDto>>> Handle(GetAnimalSpeaksForTodayQuery request, CancellationToken cancellationToken)
    {
        var day = new DateOnly(_clock.Today.Year, _clock.Today.Month, _clock.Today.Day);
        var speaks = await _context.Speaks
            .Include(s => s.SpeakTimes)
            .Where(s => s.SpeakTimes.Any(x =>
                x.Range.End.Year >= day.Year &&
                x.Range.End.Month >= day.Month &&
                x.Range.End.Day >= day.Day
            ))
            .ToListAsync(cancellationToken);

        return speaks
            .Where(s => s.SpeakTimes.Any())
            .Select(s => new
            {
                s.Title,
                SpeakTime = s.SpeakTimes
                    .Where(x =>  x.Days.ToDays().Contains(day.DayOfWeek.ToString()))
                    .OrderByDescending(x => x.Range.Start)
                    .Where(x =>
                    {
                        var rangeStart = x.Range.Start;
                        var rangeEnd = x.Range.End;
                        var dateStart = new DateOnly(rangeStart.Year, rangeStart.Month, rangeStart.Day);
                        var dateEnd = new DateOnly(rangeEnd.Year, rangeEnd.Month, rangeEnd.Day);

                        // Today should be between dateStart & dateEnd
                        return dateStart <= day && dateEnd >= day;
                    })
                    // Since it's sorted, a way to take the closest SpeakTIme to today is taking the first
                    .FirstOrDefault()
            })
            .Where(x => x.SpeakTime is not null)
            .Select(x => new SpeakDto(
                x.Title,
                x.SpeakTime!.Range.Start,
                x.SpeakTime.Range.End,
                x.SpeakTime.Days.ToDays()
            ))
            .OrderBy(x => new TimeOnly(x.Start.Hour, x.Start.Minute, x.Start.Second))
            .ToList();
    }
}

[ApiController]
[MethodGroup(Groups.Speaks)]
public partial class GetSpeaksForTodayController : ZooController
{
    private readonly IMediator _mediator;

    public GetSpeaksForTodayController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("speaks/today")]
    [ResponseCache(Duration = 3600)]
    public async partial Task<ActionResult> GetSpeaksForToday(CancellationToken cancellationToken)
    {
        var command = new GetAnimalSpeaksForTodayQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}