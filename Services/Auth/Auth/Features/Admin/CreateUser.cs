using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Auth.Entities;
using Zeta.Inpark.Auth.Services;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Features.Admin;

public static class CreateUser
{
    public record Command(
        Guid Id, 
        string EmailAddress, 
        string Password
    ) : IRequest<OneOf<Unit, Errors.EmailAddressAlreadyUsed>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Id)
                .NotEmpty();

            RuleFor(x => x.EmailAddress)
                .NotEmpty()
                .EmailAddress();
            
            RuleFor(x => x.Password)
                .NotEmpty().WithMessage("Password is required")
                .MinimumLength(8).WithMessage("Password must be at least 8 characters long")
                .MaximumLength(64).WithMessage("Password must be between 8 and 64 characters")
                .Must(x => x.Any(char.IsDigit)).WithMessage("Password must contain at least one digit")
                .Must(x => x.Any(char.IsLetter)).WithMessage("Password must contain at least one letter")
                .Must(x => x.Any(char.IsUpper)).WithMessage("Password must contain at least one uppercase letter")
                .Must(x => x.Any(char.IsLower)).WithMessage("Password must contain at least one lowercase letter");
        }
    }
    
    public class Handler : IRequestHandler<Command, OneOf<Unit, Errors.EmailAddressAlreadyUsed>>
    {
        private readonly AuthDbContext _context;
        private readonly PasswordService _passwordService;

        public Handler(AuthDbContext context, PasswordService passwordService)
        {
            _context = context;
            _passwordService = passwordService;
        }

        public async Task<OneOf<Unit, Errors.EmailAddressAlreadyUsed>> Handle(Command request,
            CancellationToken cancellationToken)
        {
            var existingUser = await _context.Users.FirstOrDefaultAsync(
                x => x.EmailAddress.Value == request.EmailAddress,
                cancellationToken
            );
            if (existingUser is not null)
                return new Errors.EmailAddressAlreadyUsed(request.EmailAddress);

            var emailAddress = EmailAddress.From(request.EmailAddress);
            var password = _passwordService.CreatePassword(request.Password);
            var user = User.Create(request.Id, emailAddress, password);
            
            _context.Users.Add(user);
            
            await _context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }

    public static class Errors
    {
        public record EmailAddressAlreadyUsed(string EmailAddress) : IValidationError
        {
            public string ErrorMessage => $"Email address '{EmailAddress}' is registered to a user.";
        }
    }

    public record Request(
        string EmailAddress,
        string Password
    );
}

[ApiController]
[MethodGroup(Groups.Admin)]
public partial class CreateUserController : ZooController
{
    private readonly IMediator _mediator;

    public CreateUserController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("admin/user")]
    public async partial Task<ActionResult> CreateUser([FromBody] CreateUser.Request request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateUser.Command(id, request.EmailAddress, request.Password);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}