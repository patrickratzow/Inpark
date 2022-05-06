using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.Events.Interfaces;

namespace Zoo.Inpark.Features.Events.AalborgZoo;

public record UpdateAalborgZooParkEventsCommand : IRequest<OneOf<Unit>>;
public class UpdateAalborgZooParkEventsCommandHandler : IRequestHandler<UpdateAalborgZooParkEventsCommand, OneOf<Unit>>
{
    private readonly IParkEventRepository _repository;
    private readonly IParkEventMapper _mapper;
    private readonly ILogger<UpdateAalborgZooParkEventsCommandHandler> _logger;
    private readonly InparkDbContext _context;

    public UpdateAalborgZooParkEventsCommandHandler(IParkEventRepository repository, IParkEventMapper mapper,
        ILogger<UpdateAalborgZooParkEventsCommandHandler> logger, InparkDbContext context)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
        _context = context;
    }

    public async Task<OneOf<Unit>> Handle(UpdateAalborgZooParkEventsCommand request,
       CancellationToken cancellationToken)
    {
        try
        {
            var response = await _repository.GetContent();
            if (!response.IsSuccess(out var responseData))
            {
                _logger.LogError(
                    "Failed to complete AalborgZooParkEventsJob because the Zoo API didn't give the expected result");

                return Unit.Value;
            }
            var parkEventsResponse = _mapper.ParseParkEvent(responseData!);
            if (!parkEventsResponse.IsSuccess(out var parkEvents))
            {
                _logger.LogError("Failed to complete AalborgZooParkEventsJob because the Zoo API response couldn't be decoded properly");

                return Unit.Value;
            }

            await UpdateParkEvents(parkEvents!, cancellationToken);

            return Unit.Value;
        }
        catch (Exception ex)
        {
            _logger.LogError(
                "Failed to complete AalborgZooOpeningHoursJob for an unknown reason. Exception: {Exception}", ex);

            return Unit.Value;
        }
    }

    private async Task UpdateParkEvents(List<ParkEvent> parkEvents, CancellationToken cancellationToken)
    {
        await using var trx = await _context.Database.BeginTransactionAsync(IsolationLevel.Serializable,
            cancellationToken);

        try
        {
            // For now it's simply easier to just wipe the entire thing rather than do differential updating
            var dbEvents = await _context.ParkEvents.ToListAsync(cancellationToken);
            _context.ParkEvents.RemoveRange(dbEvents);
            _context.ParkEvents.AddRange(parkEvents);

            await _context.SaveChangesAsync(cancellationToken);

            await trx.CommitAsync(cancellationToken);

            _logger.LogInformation("Updated park events");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update park events. Exception {Exception}", ex);

            await trx.RollbackAsync(cancellationToken);
        }
    }
}

