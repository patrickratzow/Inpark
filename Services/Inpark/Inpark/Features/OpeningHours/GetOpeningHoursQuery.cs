using Microsoft.EntityFrameworkCore;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Enums;

namespace Zoo.Inpark.Features.OpeningHours;

public record GetOpeningHoursQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursQueryHandler 
    : IRequestHandler<GetOpeningHoursQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly InparkDbContext _context;
    
    public GetOpeningHoursQueryHandler(InparkDbContext context)
    {
        _context = context;
    }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursQuery request,
        CancellationToken cancellationToken)
    {
        var openingHours = await _context.OpeningHours
            .AsNoTracking()
            .OrderByDescending(x => x.Range.Start)
            .ToListAsync(cancellationToken);
        
        return openingHours
            .Select(longestOpeningHour => new OpeningHourDto(
                    longestOpeningHour!.Name, 
                    longestOpeningHour.Range.Start, 
                    longestOpeningHour.Range.End, 
                    longestOpeningHour.Open, 
                    longestOpeningHour.Days.ToDays()
                )
            ).ToList();
    }
}

[ApiController]
[MethodGroup(Groups.OpeningHours)]
public partial class GetOpeningHoursController : ZooController
{
    private readonly IMediator _mediator;

    public GetOpeningHoursController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Gets all opening hours
    /// </summary>
    [HttpGet("opening-hours")]
    public async partial Task<ActionResult> GetOpeningHours(CancellationToken cancellationToken)
    {
        var command = new GetOpeningHoursQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}