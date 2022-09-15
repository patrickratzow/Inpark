using Zeta.Common.Api;
using Zeta.Inpark.Contracts;
using Zeta.Inpark.Features.OpeningHours.Interfaces;

namespace Zeta.Inpark.Features.OpeningHours;

public record GetOpeningHoursQuery : IRequest<OneOf<List<OpeningHourDto>>>;

public class GetOpeningHoursQueryHandler 
    : IRequestHandler<GetOpeningHoursQuery, OneOf<List<OpeningHourDto>>>
{
    private readonly IOpeningHoursRepository _repository;
    private readonly IOpeningHoursMapper _mapper;

    public GetOpeningHoursQueryHandler(IOpeningHoursRepository repository, IOpeningHoursMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public async Task<OneOf<List<OpeningHourDto>>> Handle(GetOpeningHoursQuery request,
        CancellationToken cancellationToken)
    {
        var openingHours = await _repository.GetAll();
        
        return openingHours
            .Select(_mapper.MapToDto)
            .ToList();
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
    [ResponseCache(Duration = 43200)]
    public async partial Task<ActionResult> GetOpeningHours(CancellationToken cancellationToken)
    {
        var command = new GetOpeningHoursQuery();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}