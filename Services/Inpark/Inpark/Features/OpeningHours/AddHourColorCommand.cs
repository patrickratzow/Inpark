using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.OpeningHours.Errors;

namespace Zeta.Inpark.Features.OpeningHours;

public record AddHourColorCommand(
    Guid Id,
    DateTime Start, 
    DateTime End, 
    string Color
) : IRequest<OneOf<Unit, TimeRangeAlreadyHasAColor>>;

public class AddHourColorCommandHandler : IRequestHandler<AddHourColorCommand, 
    OneOf<Unit, TimeRangeAlreadyHasAColor>>
{
    private readonly InparkDbContext _context;
    private readonly ILogger<AddHourColorCommand> _logger;

    public AddHourColorCommandHandler(InparkDbContext context, ILogger<AddHourColorCommand> logger)
    {
        _context = context;
        _logger = logger;
    }

    public async Task<OneOf<Unit, TimeRangeAlreadyHasAColor>> Handle(
        AddHourColorCommand request, 
        CancellationToken cancellationToken)
    {
        
        var existingHourRange = await _context.HourRanges.FirstOrDefaultAsync(
            tr => tr.Start.TimeOfDay == request.Start.TimeOfDay && tr.End.TimeOfDay == request.End.TimeOfDay, 
            cancellationToken
        );
        if (existingHourRange is not null) return new TimeRangeAlreadyHasAColor(existingHourRange.ToString());
   
        var hourRange = HourRange.Create(request.Id, request.Start, request.End, request.Color);
        _context.HourRanges.Add(hourRange);
        
        await _context.SaveChangesAsync(cancellationToken);
        
        return Unit.Value;
    }
}

public record AddHourColorRequest(
    DateTime Start,
    DateTime End,
    string Color
);

[ApiController]
[MethodGroup(Groups.OpeningHours)]
public partial class AddHourColorController : ZooController
{
    private readonly IMediator _mediator;

    public AddHourColorController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Add an hour range with a color
    /// </summary>
    [HttpPost("opening-hours/hour-range")]
    [ResponseCache(Duration = 3600)]
    public async partial Task<ActionResult> AddHourColor([FromBody] AddHourColorRequest request, CancellationToken cancellationToken)
    {
        var guid = Guid.NewGuid();
        var command = new AddHourColorCommand(
            guid,
            request.Start,
            request.End,
            request.Color
        );
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}