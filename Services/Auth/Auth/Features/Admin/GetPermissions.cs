using Microsoft.EntityFrameworkCore;
using Zeta.Common;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.Contracts;

namespace Zeta.Inpark.Auth.Features.Admin;

public class GetPermissions
{
    public record Query(Guid AdminId) : IRequest<OneOf<Response, AdminNotFound>>;

    public class QueryValidator : AbstractValidator<Query>
    {
        public QueryValidator()
        {
            RuleFor(x => x.AdminId).NotEmpty();
        }
    }

    public class Handler : IRequestHandler<Query, OneOf<Response, AdminNotFound>>
    {
        private readonly AuthDbContext _context;

        public Handler(AuthDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Response, AdminNotFound>> Handle(Query request, CancellationToken cancellationToken)
        {
            var admin = await _context.Admins
                .Include(x => x.Permissions)
                .Include(x => x.Roles)
                .ThenInclude(r => r.Permissions)
                .FirstOrDefaultAsync(x => x.Id == request.AdminId, cancellationToken);
            if (admin is null) return new AdminNotFound(request.AdminId);

            var rolePermissions = admin.Roles.SelectMany(x => x.Permissions);
            var adminPermissions = admin.Permissions;
            var permissions = adminPermissions
                .Concat(rolePermissions)
                .DistinctBy(x => x.Id)
                .Select(x => new PermissionDto(x.Id))
                .ToList();

            return new Response(permissions);
        }
    }

    public record AdminNotFound(Guid AdminId) : INotFoundError
    {
        public string ErrorMessage => $"No admin with the id ${AdminId} could be found";
    }
    
    public record Response(
        List<PermissionDto> Permissions
    );
}

[ApiController]
[MethodGroup(Groups.Admins)]
public partial class GetPermissionsController : ZooController
{
    private readonly IMediator _mediator;

    public GetPermissionsController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("auth/{adminId:guid}/permissions")]
    public async partial Task<ActionResult> GetPermissions([FromRoute] Guid adminId, CancellationToken cancellationToken)
    {
        var command = new GetPermissions.Query(adminId);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result);
    }
}