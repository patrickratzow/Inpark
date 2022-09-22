using Microsoft.EntityFrameworkCore;
using Zeta.Common.Api;
using Zeta.Common.Api.Versioning;
using Zeta.Inpark.Contracts;
using Zeta.Inpark.Enums;

namespace Zeta.Inpark.Features.Speaks;

[Version("1.0.0")]
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
        var today = new DateOnly(_clock.Today.Year, _clock.Today.Month, _clock.Today.Day);
        var dateTime = today.ToDateTime(TimeOnly.MinValue);
        var value = (int)Enum.Parse(typeof(WeekDay), today.DayOfWeek.ToString());
        var speaks = await _context.Speaks
            .AsNoTracking()
            .Select(s => new
            {
                s.Title,
                ImagePair = s.Image,
                SpeakTime = s.SpeakTimes
                    .Where(x => 
                        x.Range.Start.Date <= dateTime.Date && 
                        x.Range.End.Date >= dateTime.Date && 
                        ((int)x.Days & value) != 0
                    )
                    // ReSharper disable once SimplifyLinqExpressionUseMinByAndMaxBy
                    .OrderByDescending(x => x.Range.Start)
                    .FirstOrDefault()
            })
            .Where(x => x.SpeakTime != null)
            .OrderBy(x => x.SpeakTime!.Range.Start.TimeOfDay)
            .ToListAsync(cancellationToken);
            
        return speaks
            .Select(x => new SpeakDto(
                x.Title,
                x.SpeakTime!.Range.Start,
                x.SpeakTime.Range.End,
                new ImagePairDto(x.ImagePair.PreviewUrl, x.ImagePair.FullscreenUrl),
                x.SpeakTime.Days.ToDays()
            ))
            .ToList();
    }
}

/// <summary>
/// Get all speaks in the park.
/// </summary>
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