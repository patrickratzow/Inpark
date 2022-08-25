using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.Speaks.Interfaces;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.Speaks.AalborgZoo;

public record UpdateAalborgZooSpeaksCommand : IRequest<OneOf<Unit>>;

public class UpdateAalborgZooSpeaksCommandHandler : IRequestHandler<UpdateAalborgZooSpeaksCommand, OneOf<Unit>>
{
    private readonly ISpeaksRepository _repository;
    private readonly ISpeaksMapper _mapper;
    private readonly ILogger<UpdateAalborgZooSpeaksCommandHandler> _logger;
    private readonly InparkDbContext _context;
    
    public UpdateAalborgZooSpeaksCommandHandler(ISpeaksRepository repository, ISpeaksMapper mapper, ILogger<UpdateAalborgZooSpeaksCommandHandler> logger, InparkDbContext context)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
        _context = context;
    }

    public async Task<OneOf<Unit>> Handle(UpdateAalborgZooSpeaksCommand request, CancellationToken cancellationToken)
    {
        try
        {
            var previousWeek = DateTime.Today.AddDays(-7);
            var nextWeek = DateTime.Today.AddDays(7);
            var range = TimeRange.From(previousWeek, nextWeek);
            
            var rangeResponse = await _repository.GetRange(range);
            if (!rangeResponse.IsSuccess(out var rangeData))
            {
                _logger.LogError(
                    "Failed to complete AalborgZooSpeaksJob because the Zoo API didn't give the expected result");

                return Unit.Value;
            }
            var speaksResponse = _mapper.Parse(rangeData!);
            if (!speaksResponse.IsSuccess(out var speaks))
            {
                _logger.LogError(
                    "Failed to complete AalborgZooSpeaksJob because the Zoo API response couldn't be decoded properly");

                return Unit.Value;
            }

            await UpdateSpeaks(speaks!, cancellationToken);

            return Unit.Value;
        }
        catch (Exception ex)
        {
            _logger.LogError(
                "Failed to complete AalborgZooSpeaksJob for an unknown reason. Exception: {Exception}", ex);

            return Unit.Value;
        }
    }

    private async Task UpdateSpeaks(List<Speak> speaks, CancellationToken cancellationToken)
    {
        await using var trx = await _context.Database.BeginTransactionAsync(IsolationLevel.Serializable, 
            cancellationToken);
        try
        {
            var dbSpeaks = await _context.Speaks.ToListAsync(cancellationToken);
            _context.Speaks.RemoveRange(dbSpeaks);
            _context.Speaks.AddRange(speaks);

            await _context.SaveChangesAsync(cancellationToken);

            await trx.CommitAsync(cancellationToken);

            _logger.LogInformation("Updated speaks successfully");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update speaks. Exception {Exception}", ex);
            
            await trx.RollbackAsync(cancellationToken);
        }
    }
}