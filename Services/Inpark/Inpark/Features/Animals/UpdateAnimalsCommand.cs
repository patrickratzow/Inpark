using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.Animals;

public record UpdateAnimalsCommand : IRequest<OneOf<Unit>>;


public class UpdateAnimalsCommandHandler : IRequestHandler<UpdateAnimalsCommand, OneOf<Unit>>
{
    private readonly IAalborgZooContentRepository _contentRepository;
    private readonly IAalborgZooAnimalContentMapper _contentMapper;
    private readonly ILogger<UpdateAnimalsCommandHandler> _logger;
    private readonly InparkDbContext _context;

    public UpdateAnimalsCommandHandler(IAalborgZooContentRepository contentRepository, 
        IAalborgZooAnimalContentMapper contentMapper, ILogger<UpdateAnimalsCommandHandler> logger, InparkDbContext context)
    {
        _contentRepository = contentRepository;
        _contentMapper = contentMapper;
        _logger = logger;
        _context = context;
    }
    
    public async Task<OneOf<Unit>> Handle(UpdateAnimalsCommand request, CancellationToken cancellationToken)
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

        await UpdateAnimals(animals!, cancellationToken);

        return Unit.Value;
    }

    private async Task UpdateAnimals(List<Animal> animals, CancellationToken cancellationToken)
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

            _logger.LogInformation("Updated animals successfully");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update animals. Exception {Exception}", ex);
            
            await trx.RollbackAsync(cancellationToken);
        }
    }
}