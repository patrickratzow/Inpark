using FluentValidation;
using MediatR;
using Microsoft.Extensions.Logging;
using OneOf;
using Zeta.Inpark.Maps.Entities;

namespace Zeta.Inpark.Maps.Features;

public class ProcessPingLocation
{
    public record Command(
        Guid PingId,
        Guid UserId,
        double Latitude,
        double Longitude
    ) : IRequest<OneOf<Unit>>;
    
    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.PingId).NotEmpty();
            RuleFor(x => x.UserId).NotEmpty();
            RuleFor(x => x.Latitude)
                .NotEmpty()
                .GreaterThanOrEqualTo(-90)
                .LessThanOrEqualTo(90);
            RuleFor(x => x.Longitude)
                .NotEmpty()
                .GreaterThanOrEqualTo(-180)
                .LessThanOrEqualTo(180);
        }
    }
    
    public class Handler : IRequestHandler<Command, OneOf<Unit>>
    {
        private readonly MapsDbContext _context;
        private readonly ILogger<Handler> _logger;

        public Handler(MapsDbContext context, ILogger<Handler> logger)
        {
            _context = context;
            _logger = logger;
        }

        public async Task<OneOf<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            using var _ = _logger.BeginScope($"{nameof(QueuePingLocation)}.{nameof(Handler)}");
        
            var user = await _context.Users.FindAsync(new object?[] { request.UserId }, cancellationToken);
            if (user is null)
            {
                user = User.Create(request.UserId);
                
                _context.Users.Add(user);
            }
            
            var ping = Ping.Create(request.PingId, user, request.Latitude, request.Longitude);
            _context.Pings.Add(ping);            
            
            _logger.LogInformation("Created ping {PingId} for user {UserId}", ping.Id, user.Id);
            
            await _context.SaveChangesAsync(cancellationToken);
            
            return Unit.Value;
        }
    }
}