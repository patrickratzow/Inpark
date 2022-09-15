using Microsoft.EntityFrameworkCore;
using Zeta.Common;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.Services;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Features.Admin;

public static class CreateAdmin
{
    public record Command(
        Guid Id, 
        string EmailAddress, 
        string Password
    ) : IRequest<OneOf<Unit, EmailAddressAlreadyUsed>>;

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
    
    public class Handler : IRequestHandler<Command, OneOf<Unit, EmailAddressAlreadyUsed>>
    {
        private readonly AuthDbContext _context;
        private readonly PasswordService _passwordService;

        public Handler(AuthDbContext context, PasswordService passwordService)
        {
            _context = context;
            _passwordService = passwordService;
        }

        public async Task<OneOf<Unit, EmailAddressAlreadyUsed>> Handle(Command request,
            CancellationToken cancellationToken)
        {
            var existingUser = await _context.Admins.FirstOrDefaultAsync(
                x => x.EmailAddress.Value == request.EmailAddress,
                cancellationToken
            );
            if (existingUser is not null)
                return new EmailAddressAlreadyUsed(request.EmailAddress);

            var emailAddress = EmailAddress.From(request.EmailAddress);
            var password = _passwordService.CreatePassword(request.Password);
            var user = Entities.Admin.Create(request.Id, emailAddress, password);
            
            _context.Admins.Add(user);
            
            await _context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }

    public record EmailAddressAlreadyUsed(string EmailAddress) : IValidationError
    {
        public string ErrorMessage => $"Email address '{EmailAddress}' is registered to a user.";
    }

    public record Request(
        string EmailAddress,
        string Password
    );
}

[ApiController]
[MethodGroup(Groups.Admins)]
public partial class CreateAdminController : ZooController
{
    private readonly IMediator _mediator;

    public CreateAdminController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("auth/admins")]
    public async partial Task<ActionResult> CreateAdmin([FromBody] CreateAdmin.Request request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateAdmin.Command(id, request.EmailAddress, request.Password);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}