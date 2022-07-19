using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.OpeningHours.Interfaces;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.OpeningHours.AalborgZoo;

public record UpdateAalborgZooOpeningHoursCommand : IRequest<OneOf<Unit>>;

public class UpdateAalborgZooOpeningHoursCommandHandler : IRequestHandler<UpdateAalborgZooOpeningHoursCommand, OneOf<Unit>>
{
    private readonly IOpeningHoursRepository _repository;
    private readonly IOpeningHoursMapper _mapper;
    private readonly ILogger<UpdateAalborgZooOpeningHoursCommandHandler> _logger;
    private readonly InparkDbContext _context;

    public UpdateAalborgZooOpeningHoursCommandHandler(IOpeningHoursRepository repository, IOpeningHoursMapper mapper, 
        ILogger<UpdateAalborgZooOpeningHoursCommandHandler> logger, InparkDbContext context)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
        _context = context;
    }

    public async Task<OneOf<Unit>> Handle(UpdateAalborgZooOpeningHoursCommand request,
        CancellationToken cancellationToken)
    {
        try
        {
            var lastYear = DateTime.Today.AddYears(-1);
            var nextYear = DateTime.Today.AddYears(1);
            var range = TimeRange.From(lastYear, nextYear);
            
            var rangeResponse = await _repository.GetRange(range);
            if (!rangeResponse.IsSuccess(out var rangeData))
            {
                _logger.LogError(
                    "Failed to complete AalborgZooOpeningHoursJob because the Zoo API didn't give the expected result");

                return Unit.Value;
            }
            var openingHoursResponse = await _mapper.Parse(rangeData!);
            if (!openingHoursResponse.IsSuccess(out var openingHours))
            {
                _logger.LogError("Failed to complete AalborgZooOpeningHoursJob because the Zoo API response couldn't be decoded properly");

                return Unit.Value;
            }

            await UpdateOpeningHours(openingHours!, cancellationToken);

            return Unit.Value;
        }
        catch (Exception ex)
        {
            _logger.LogError(
                "Failed to complete AalborgZooOpeningHoursJob for an unknown reason. Exception: {Exception}", ex);

            return Unit.Value;
        }
    }

    private async Task UpdateOpeningHours(List<OpeningHour> openingHours, CancellationToken cancellationToken)
    {
        await using var trx = await _context.Database.BeginTransactionAsync(IsolationLevel.Serializable, 
            cancellationToken);
        
        try
        {
            // For now it's simply easier to just wipe the entire thing rather than do differential updating
            var dbHours = await _context.OpeningHours.ToListAsync(cancellationToken);
            _context.OpeningHours.RemoveRange(dbHours);
            _context.OpeningHours.AddRange(openingHours);

            await _context.SaveChangesAsync(cancellationToken);

            await trx.CommitAsync(cancellationToken);

            _logger.LogInformation("Updated opening hours");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update opening hours. Exception {Exception}", ex);
            
            await trx.RollbackAsync(cancellationToken);
        }
    }
}