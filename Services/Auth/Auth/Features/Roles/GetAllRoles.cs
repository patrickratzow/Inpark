using Microsoft.EntityFrameworkCore;
using Zeta.Inpark.Auth.Contracts;

namespace Zeta.Inpark.Auth.Features.Roles;

public class GetAllRoles
{
    public record Query : IRequest<OneOf<Response>>;

    public class Handler : IRequestHandler<Query, OneOf<Response>>
    {
        private readonly AuthDbContext _context;
        private readonly ITenantManager _tenantManager;

        public Handler(AuthDbContext context, ITenantManager tenantManager)
        {
            _context = context;
            _tenantManager = tenantManager;
        }

        public async Task<OneOf<Response>> Handle(Query request, CancellationToken cancellationToken)
        {
            var tenantId = _tenantManager.Tenant.Id;
            var roles = await _context.Roles
                .Where(r => r.Tenant.Id == tenantId)
                .Select(r => new RoleDto(
                    r.Id,
                    r.Name,
                    r.Color.Value
                ))
                .ToListAsync(cancellationToken);
            
            return new Response(roles);
        }
    }

    public record Response(
        List<RoleDto> Roles
    );
}

[ApiController]
[MethodGroup(Groups.Roles)]
public partial class GetAllRolesController : ZooController
{
    private readonly IMediator _mediator;

    public GetAllRolesController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("auth/roles")]
    public async partial Task<ActionResult> GetAllRoles(CancellationToken cancellationToken)
    {
        var command = new GetAllRoles.Query();
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}

