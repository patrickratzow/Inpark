using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OneOf;
using Zeta.Inpark.Tenants.Contracts;
using Zeta.Inpark.Tenants.Errors;
using Zoo.Common.Api;

namespace Zeta.Inpark.Tenants.Features;

public static class GetService
{
    public record Query(
        Guid TenantId,
        string ServiceId
    ) : IRequest<OneOf<ServiceDto, ServiceNotFound, TenantNotFound>>;

    public class QueryValidator : AbstractValidator<Query>
    {
        public QueryValidator()
        {
            RuleFor(x => x.TenantId).NotEmpty();
            RuleFor(x => x.ServiceId).NotEmpty();
        }
    }

    public class QueryHandler : IRequestHandler<Query, OneOf<ServiceDto,ServiceNotFound,TenantNotFound>>
    {
        private readonly TenantDbContext _context;

        public QueryHandler(TenantDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<ServiceDto,ServiceNotFound,TenantNotFound>> Handle(Query request, CancellationToken cancellationToken)
        {
            //We want to find a services from its ID
            //To Identify this service we need a 
            //Create new feature listDto
            //Create new ServiceDto
            var tenant = await _context.Tenants
                .Include(x => x.Services)
                .ThenInclude(x => x.Features)
                .FirstOrDefaultAsync(t => t.Id == request.TenantId, cancellationToken: cancellationToken);
            if (tenant is null) return new TenantNotFound(request.TenantId);

            var service = tenant.Services.FirstOrDefault(x => x.ServiceId == request.ServiceId);
            if (service is null) return new ServiceNotFound(request.ServiceId);

            var featureDto = service.Features.Select(
                x => new FeatureDto(
                    x.FeatureId,
                    x.Data
                    )
            ).ToList();
            
            return new ServiceDto(
                service.ServiceId,
                featureDto
            );
        }
    }
}

[ApiController]
[MethodGroup(Groups.Tenant)]
public partial class GetServiceController : ZooController
{
    private readonly IMediator _mediator;

    public GetServiceController(IMediator mediator)
    {
        _mediator = mediator;
    }

    /// <summary>
    /// Gets a service for a tenant
    /// </summary>
    [HttpGet("tenants/{tenantId:guid}/services/{serviceId}")]
    public async partial Task<ActionResult> GetService([FromRoute] Guid tenantId, [FromRoute] string serviceId)
    {
        var query = new GetService.Query(tenantId, serviceId);
        var result = await _mediator.Send(query);

        return Map(result);
    }
}


