using FluentValidation;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OneOf;
using Zeta.Inpark.Maps.Contracts;
using Zeta.Inpark.Maps.Entities;

namespace Zeta.Inpark.Maps.Features;

public class QueuePingLocation
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
        private readonly QueueService _queueService;
        private readonly ILogger<Handler> _logger;

        public Handler(QueueService queueService, ILogger<Handler> logger)
        {
            _queueService = queueService;
            _logger = logger;
        }

        public async Task<OneOf<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            using var _ = _logger.BeginScope($"{nameof(QueuePingLocation)}.{nameof(Handler)}");
        
            var pingId = Guid.NewGuid();
            var ping = new PingQueueDto(pingId, request.UserId, request.Latitude, request.Longitude);
            _logger.LogInformation("Queueing {Ping}", ping.ToString());

            await _queueService.Send("pings", ping);
            
            return Unit.Value;
        }
    }
}
