using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OneOf;
using Zeta.Inpark.Maps.Entities;

namespace Zeta.Inpark.Maps.Features;

public class PingLocation
{
    public record Command(
        Guid UserId,
        double Latitude,
        double Longitude
    ) : IRequest<OneOf<Unit>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
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
            using var _ = _logger.BeginScope($"{nameof(PingLocation)}.{nameof(Handler)}");
            
            var user = await _context.Users.FindAsync(new object?[] { request.UserId }, cancellationToken);
            if (user is null)
            {
                user = User.Create(request.UserId);
                _logger.LogInformation("No user with the Id {UserId} existed. Creating one", user.Id);
                
                _context.Users.Add(user);
            }

            var pingId = Guid.NewGuid();
            var ping = Ping.Create(pingId, user, request.Latitude, request.Longitude);
            user.AddLocationPing(ping);
            _logger.LogInformation("Added Ping {Ping} to User with the id {UserId}", ping.ToString(), user.Id); 

            _context.Pings.Add(ping);
            
            await _context.SaveChangesAsync(cancellationToken);
            
            return Unit.Value;
        }
    }
}
