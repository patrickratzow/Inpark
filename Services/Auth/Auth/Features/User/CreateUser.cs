using Microsoft.EntityFrameworkCore;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.Entities;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Features.User;
public static class CreateUser
{
    public record Command(
        Guid Id,
        string UserId,
        string DisplayName,
        Provider Provider
    ) : IRequest<OneOf<Unit, UserAlreadyExists, UnableToHandleProvider>>;

    public record Provider(
        string? DisplayName,
        string? Email,
        string? PhotoUrl,
        string ProviderId,
        string? PhoneNumber
    );

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(c => c.Id)
                .NotEmpty();

            RuleFor(c => c.UserId)
                .NotEmpty();

            RuleFor(c => c.DisplayName)
                .NotEmpty();

            RuleFor(c => c.Provider)
                .NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Command, OneOf<Unit, UserAlreadyExists, UnableToHandleProvider>>
    {
        private readonly AuthDbContext _context;

        public Handler(AuthDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Unit, UserAlreadyExists, UnableToHandleProvider>> Handle(Command request, CancellationToken cancellationToken)
        {
            var userExists = await _context.Users
                .AnyAsync(u => u.UserId == request.UserId, cancellationToken);
            if (userExists) return new UserAlreadyExists(request.UserId);

            Entities.Provider? provider = request.Provider.ProviderId switch
            {
                "google.com" => GoogleProvider.From(
                    request.Provider.ProviderId,
                    request.Provider.DisplayName,
                    EmailAddress.From(request.Provider.Email!),
                    request.Provider.PhotoUrl,
                    request.Provider.PhoneNumber
                ),
                "facebook.com" => FacebookProvider.From(
                    request.Provider.ProviderId,
                    request.Provider.DisplayName,
                    EmailAddress.From(request.Provider.Email!),
                    request.Provider.PhotoUrl,
                    request.Provider.PhoneNumber
                ),
                _ => null,
            };
            if (provider is null) return new UnableToHandleProvider(request.Provider.ProviderId);
                
            var user = Entities.User.Create(
                request.Id,
                request.UserId,
                request.DisplayName,
                provider
            );

            _context.Users.Add(user);

            await _context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }

    public record UserAlreadyExists(string UserId) : IAlreadyExistsError
    {
        public string ErrorMessage => $"An user with the user id {UserId} already exists";
    }

    public record UnableToHandleProvider(string ProviderId) : IValidationError
    {
        public string ErrorMessage => $"Unable to handle any provider with the id {ProviderId}";
    }

    public record Request(        
        string UserId,
        string DisplayName,
        Provider Provider
    );
}

[ApiController]
[MethodGroup(Groups.Users)]
public partial class CreateUserController : ZooController
{
    private readonly IMediator _mediator;

    public CreateUserController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Creates a user.
    /// </summary>
    [HttpPost("user")]
    public async partial Task<ActionResult> CreateUser([FromBody] CreateUser.Request request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateUser.Command(id, request.UserId, request.DisplayName, request.Provider);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}