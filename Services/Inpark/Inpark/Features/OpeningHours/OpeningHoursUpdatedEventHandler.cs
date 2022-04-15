using System.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Common;
using Zoo.Inpark.Features.OpeningHours.Events;

namespace Zoo.Inpark.Features.OpeningHours;

public class OpeningHoursUpdatedEventHandler 
    : INotificationHandler<DomainEventNotification<OpeningHoursUpdatedEvent>>
{
    private readonly InparkDbContext _context;
    private readonly ILogger<OpeningHoursUpdatedEventHandler> _logger;

    public OpeningHoursUpdatedEventHandler(InparkDbContext context, 
        ILogger<OpeningHoursUpdatedEventHandler> logger)
    {
        _context = context;
        _logger = logger;
    }

    public async Task Handle(DomainEventNotification<OpeningHoursUpdatedEvent> notification,
        CancellationToken cancellationToken)
    {
        var openingHours = notification.DomainEvent.OpeningHours;
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

            _logger.LogError("Updated opening hours");
        }
        catch (Exception ex)
        {
            _logger.LogError("Failed to update opening hours. Exception {Exception}", ex);
            
            await trx.RollbackAsync(cancellationToken);
        }
    }
}