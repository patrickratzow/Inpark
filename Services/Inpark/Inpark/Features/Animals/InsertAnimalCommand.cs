using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.Animals;

public record InsertAnimalCommand : IRequest<OneOf<Unit>>;


public class InsertAnimalCommandHandler : IRequestHandler<InsertAnimalCommand, OneOf<Unit>>
{
    private readonly IAalborgZooContentRepository _contentRepository;
    private readonly IAalborgZooAnimalContentMapper _contentMapper;
    private readonly ILogger<InsertAnimalCommandHandler> _logger;
    private readonly InparkDbContext _context;

    public InsertAnimalCommandHandler(IAalborgZooContentRepository contentRepository, 
        IAalborgZooAnimalContentMapper contentMapper, ILogger<InsertAnimalCommandHandler> logger, InparkDbContext context)
    {
        _contentRepository = contentRepository;
        _contentMapper = contentMapper;
        _logger = logger;
        _context = context;
    }
    
    public async Task<OneOf<Unit>> Handle(InsertAnimalCommand request, CancellationToken cancellationToken)
    {
        var animalOverview = await _contentRepository.GetContent();
        if (!animalOverview.IsSuccess(out var animalsData))
        {
            _logger.LogError("Failed to insert animals because the Zoo API didn't give the expected result");

            return Unit.Value;
        }
        
        var mapAnimal = _contentMapper.ParseAnimalOverview(animalsData!);
        if (!mapAnimal.IsSuccess(out var animals))
        {
            _logger.LogError("Failed parsing animal overview");

            return Unit.Value;
        }

        await InsertAnimals(animals!, cancellationToken);

        return Unit.Value;
    }

    private async Task InsertAnimals(List<Animal> animals, CancellationToken cancellationToken)
    {
        await using var trx = await _context.Database.BeginTransactionAsync(IsolationLevel.Serializable, 
            cancellationToken);

        try
        {
            var animalsSet = animals.ToHashSet();
            var animalsToUpdate =  _context.Animals.AsEnumerable()
                .Where(x => animals.Any(a => a.Name.LatinName == x.Name.LatinName))
                .ToList();
            
            foreach (var animal in animalsToUpdate)
            {
                var newAnimal = animals.First(a => a.Name.LatinName == animal.Name.LatinName);
                animal.Update(newAnimal.Name, newAnimal.Image, newAnimal.Category, newAnimal.Content);
                animalsSet.Remove(newAnimal);
            }
            
            foreach (var animal in animalsSet)
            {
                _context.Animals.Add(animal);
            }

            var animalsToDelete =  _context.Animals.AsEnumerable()
                .Where(x => animals.All(a => a.Name.LatinName != x.Name.LatinName))
                .ToList();
            
            foreach (var animal in animalsToDelete)
            {
                _context.Animals.Remove(animal);
            }
            
            await _context.SaveChangesAsync(cancellationToken);

            await trx.CommitAsync(cancellationToken);

            _logger.LogInformation("");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update opening hours. Exception {Exception}", ex);
            
            await trx.RollbackAsync(cancellationToken);
        }
    }
    
}

[ApiController]
[MethodGroup(Groups.Animals)]
public partial class InsertAnimalCommandController : ZooController
{
    private readonly IMediator _mediator;

    public InsertAnimalCommandController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Gets overview of all animals in the park.
    /// </summary>
    [HttpPost("animals")]
    public async partial Task<ActionResult> InsertAnimals(CancellationToken cancellationToken)
    {
        var command = new InsertAnimalCommand();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}

/*
foreach (var animal in overview?.Animals!)
{
    var animalName = new AnimalName(animal.Name.DisplayName, animal.Name.LatinName);
    var image = new AnimalImage(animal.Image.PreviewUrl, animal.Image.FullscreenUrl);
            
    var animal1 = new Animal(animalName, animal.Category, image, animal.Status, new Guid().ToString(), animal.Contents);
}
*/