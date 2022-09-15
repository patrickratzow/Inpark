using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Common.Api;
using Zeta.Inpark.Contracts;
using Zeta.Inpark.Errors;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.Animals;

public record SetAnimalAreaCommand(string LatinName, List<AnimalAreaDto> Areas) : IRequest<OneOf<Unit, AnimalNotFound>>;

public class SetAnimalAreaCommandHandler : IRequestHandler<SetAnimalAreaCommand, OneOf<Unit, AnimalNotFound>>
{
    private readonly ILogger<SetAnimalAreaCommandHandler> _logger;
    private readonly InparkDbContext _context;

    public SetAnimalAreaCommandHandler(ILogger<SetAnimalAreaCommandHandler> logger, InparkDbContext context)
    {
        _logger = logger;
        _context = context;
    }

    public async Task<OneOf<Unit, AnimalNotFound>> Handle(SetAnimalAreaCommand request, CancellationToken cancellationToken)
    {
        await using var trx = await _context.Database.BeginTransactionAsync(cancellationToken);

        try
        {
            var animal = await _context.Animals
                .FirstOrDefaultAsync(x => x.Name.LatinName == request.LatinName, cancellationToken);
            if (animal is null) return new AnimalNotFound(request.LatinName);
            
            var animalAreaDtos = request.Areas;
            var animalAreas = new List<AnimalArea>();
            
            foreach (var areaDto in animalAreaDtos)
            {
                var index = 0;
                var points = areaDto.Points
                    .GroupBy(_ => index++ / 2)
                    .Select(x => x.ToList())
                    .Select(x => Point.From(x[0], x[1]))
                    .ToList();

                animalAreas.Add(AnimalArea.From(
                    areaDto.Color,
                    points: points
                    ));
            }
            
            animal.SetAreas(animalAreas);

            await _context.SaveChangesAsync(cancellationToken);

            await trx.CommitAsync(cancellationToken);
            
            _logger.LogInformation("Successfully added areas to animal!");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to insert Areas to {Name} for unknown reasons", request.LatinName);
        }

        return Unit.Value;
    }
}   

public class SetAnimalAreaCommandValidator : AbstractValidator<SetAnimalAreaCommand>
{
         public SetAnimalAreaCommandValidator()
         {
             RuleFor(x => x.LatinName).NotEmpty().MaximumLength(512);
             RuleFor(x => x.Areas).NotEmpty();
         }
}

[ApiController]
[MethodGroup(Groups.Animals)]
public partial class SetAnimalAreaController : ZooController
{
    private readonly IMediator _mediator;

    public SetAnimalAreaController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Sets areas for animal in the park
    /// </summary>
    [HttpPut("animals/{latinName}/areas")]
    public async partial Task<ActionResult> SetAnimalArea([FromRoute] string latinName, [FromBody] List<AnimalAreaDto> areas, CancellationToken cancellationToken)
    {
        var query = new SetAnimalAreaCommand(latinName, areas);
        var result = await _mediator.Send(query, cancellationToken);

        return Map(result);
    }
}