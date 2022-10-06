using Microsoft.EntityFrameworkCore;
using Zeta.Common;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Features.Roles;

public class CreateRole
{
    [Auth]
    public record Command(
        Guid Id,
        string Name,
        string Color
    ) : IRequest<OneOf<Unit, NameIsAlreadyTaken>>;

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.Name).NotEmpty()
                .MinimumLength(1)
                .MaximumLength(255);
            RuleFor(x => x.Color)
                .NotEmpty()
                .Length(6);
        }
    }

    public class Handler : IRequestHandler<Command, OneOf<Unit, NameIsAlreadyTaken>>
    {
        private readonly AuthDbContext _context;
        private readonly ITenantManager _tenantManager;

        public Handler(AuthDbContext context, ITenantManager tenantManager)
        {
            _context = context;
            _tenantManager = tenantManager;
        }

        public async Task<OneOf<Unit, NameIsAlreadyTaken>> Handle(Command request,
            CancellationToken cancellationToken)
        {
            var tenantId = _tenantManager.Tenant.Id;
            var tenant = await _context.Tenants
                .Include(x => x.Roles)
                .FirstAsync(x => x.Id == tenantId, cancellationToken);
            var existingRole = tenant.Roles.FirstOrDefault(x => x.Name == request.Name);
            if (existingRole is not null) return new NameIsAlreadyTaken(request.Name);

            var color = Color.From(request.Color);
            var role = tenant.CreateRole(request.Id, request.Name, color);
            _context.Roles.Add(role);
            
            await _context.SaveChangesAsync(cancellationToken);

            return Unit.Value;
        }
    }

    public record NameIsAlreadyTaken(string Name) : IAlreadyExistsError
    {
        public string ErrorMessage => $"The role name '{Name}' is already taken.";
    }
    
    public record Request(
        string Name,
        string Color
    );
}

[ApiController]
[MethodGroup(Groups.Roles)]
public partial class CreateRoleController : ZooController
{
    private readonly IMediator _mediator;

    public CreateRoleController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("auth/roles")]
    public async partial Task<ActionResult> CreateRole([FromBody] CreateRole.Request request, 
        CancellationToken cancellationToken)
    {
        var id = Guid.NewGuid();
        var command = new CreateRole.Command(id, request.Name, request.Color);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}
