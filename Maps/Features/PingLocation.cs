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

        public Handler(MapsDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            var user = await _context.Users.FindAsync(new object?[] { request.UserId }, cancellationToken);
            if (user is null)
            {
                user = User.Create(request.UserId);
                
                _context.Users.Add(user);
            }
            
            var locationPing = user.AddLocationPing(request.Latitude, request.Longitude);
            _context.Entry(locationPing).State = EntityState.Added;
            
            await _context.SaveChangesAsync(cancellationToken);
            
            return Unit.Value;
        }
    }
}
