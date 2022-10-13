using Microsoft.EntityFrameworkCore;
using Zeta.Common;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.Services;

namespace Zeta.Inpark.Auth.Features.Admin;

public static class RefreshLogin
{
    public record Command(Guid RefreshToken) : IRequest<OneOf<Response, RefreshTokenNotFound, RefreshTokenInvalid>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.RefreshToken).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, OneOf<Response, RefreshTokenNotFound, RefreshTokenInvalid>>
    {
        private readonly AuthDbContext _context;
        private readonly IJwtService _jwtService;
        
        public Handler(AuthDbContext context, IJwtService jwtService)
        {
            _context = context;
            _jwtService = jwtService;
        }

        public async Task<OneOf<Response, RefreshTokenNotFound, RefreshTokenInvalid>> Handle(Command request,
            CancellationToken cancellationToken)
        {
            var user = await _context.Admins
                .Include(user => user.RefreshTokens)
                .Where(user => user.RefreshTokens.Any(refreshToken => refreshToken.Id == request.RefreshToken))
                .FirstOrDefaultAsync(cancellationToken);
            if (user is null) return new RefreshTokenNotFound(request.RefreshToken);
            var refreshToken = user.RefreshTokens
                .First(refreshToken => refreshToken.Id == request.RefreshToken);
            if (refreshToken.IsExpired()) return new RefreshTokenInvalid(request.RefreshToken);
            
            // Handle removing & adding of refresh tokens
            user.RemoveRefreshToken(refreshToken);
            _context.Entry(refreshToken).State = EntityState.Deleted;
            var newRefreshToken = user.CreateRefreshToken();
            _context.Entry(newRefreshToken).State = EntityState.Added;
            // Create new JWT token
            var token = _jwtService.GenerateToken(user);
            
            _context.Admins.Update(user);

            // Add domain event
            var domainEvent = new UserRefreshedLoginEvent(user.Id);
            user.AddDomainEvent(domainEvent);
            
            await _context.SaveChangesAsync(cancellationToken);
            
            return new Response(
                token,
                newRefreshToken.Id
            );
        }
    }
    
    public record RefreshTokenNotFound(Guid RefreshToken) : INotFoundError
    {
        public string ErrorMessage => $"No refresh token could be found with the id {RefreshToken}";
    }

    public record RefreshTokenInvalid(Guid RefreshToken) : IValidationError
    {
        public string ErrorMessage => $"The refresh token {RefreshToken} is not valid";
    }

    public record UserRefreshedLoginEvent(Guid UserId) : DomainEvent;
    
    public record Request(Guid RefreshToken);
    
    public record Response(string Token, Guid RefreshToken);
}

[ApiController]
[MethodGroup(Groups.Admins)]
public partial class RefreshLoginController : ZooController
{
    private readonly IMediator _mediator;

    public RefreshLoginController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("auth/admins/refresh-login")]
    public async partial Task<ActionResult> RefreshLogin([FromBody] RefreshLogin.Request request, 
        CancellationToken cancellationToken)
    {
        var command = new RefreshLogin.Command(request.RefreshToken);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}