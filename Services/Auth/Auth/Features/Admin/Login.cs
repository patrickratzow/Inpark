using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Auth.Services;

namespace Zeta.Inpark.Auth.Features.Admin;

public static class Login
{
    public record Command(
        string EmailAddress, 
        string Password
    ) : IRequest<OneOf<Response, Errors.WrongLogin>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.EmailAddress)
                .NotEmpty()
                .EmailAddress();

            RuleFor(x => x.Password)
                .NotEmpty();
        }
    }

    public record Response(
        string Token, 
        Guid RefreshToken
    );

    public class Handler : IRequestHandler<Command, OneOf<Response, Errors.WrongLogin>>
    {
        private readonly AuthDbContext _context;
        private readonly PasswordService _passwordService;
        private readonly JwtService _jwtService;

        public Handler(AuthDbContext context, PasswordService passwordService, JwtService jwtService)
        {
            _context = context;
            _passwordService = passwordService;
            _jwtService = jwtService;
        }

        public async Task<OneOf<Response, Errors.WrongLogin>> Handle(Command request,
            CancellationToken cancellationToken)
        {
            // Count the time this takes to execute
            var stopwatch = new Stopwatch();
            stopwatch.Start();
            
            var result = await HandleInternal(request, cancellationToken);
            
            stopwatch.Stop();
            
            if (stopwatch.ElapsedMilliseconds >= 250) return result;

            // If it took under 250ms to execute, wait the difference
            var delay = (int)(250 - stopwatch.ElapsedMilliseconds);
                
            await Task.Delay(delay, cancellationToken);

            return result;
        }

        private async Task<OneOf<Response, Errors.WrongLogin>> HandleInternal(Command request,
            CancellationToken cancellationToken)
        {
            var user = await _context.Admins.FirstOrDefaultAsync(
                x => x.EmailAddress.Value == request.EmailAddress,
                cancellationToken
            );
            // Unable to find any user with this email address
            if (user is null) return new Errors.WrongLogin();
            // Check if the password is correct
            var isCorrect = _passwordService.VerifyPassword(request.Password, user.Password);
            if (!isCorrect) return new Errors.WrongLogin();

            // Create tokens
            var token = _jwtService.GenerateToken(user);
            var refreshToken = user.CreateRefreshToken();
            _context.Entry(refreshToken).State = EntityState.Added;
            
            // Publish domain event
            var domainEvent = new UserLoggedInEvent(user.Id);
            user.AddDomainEvent(domainEvent);

            _context.Admins.Update(user);
            await _context.SaveChangesAsync(cancellationToken);
            
            return new Response(token, refreshToken.Id);
        }
    }
    
    public static class Errors
    {
        public record WrongLogin : IAlreadyExistsError
        {
            public string ErrorMessage => "Was unable to login with the provided credentials.";
        }
    }

    public record UserLoggedInEvent(Guid Id) : DomainEvent;

    public record Request(
        string EmailAddress,
        string Password
    );
}

[ApiController]
[MethodGroup(Groups.Admin)]
public partial class LoginController : ZooController
{
    private readonly IMediator _mediator;

    public LoginController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("auth/admin/login")]
    public async partial Task<ActionResult> Login([FromBody] Login.Request request, 
        CancellationToken cancellationToken)
    {
        var command = new Login.Command(request.EmailAddress, request.Password);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}