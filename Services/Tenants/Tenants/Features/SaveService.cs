using System.Net;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OneOf;
using Zeta.Inpark.Tenants.Entities;
using Zeta.Inpark.Tenants.Errors;
using Zoo.Common.Api;
using Zoo.Common.Api.SourceGenerator.Attributes.OpenApi;
using Tenant = Zeta.Inpark.Tenants.Entities.Tenant;

namespace Zeta.Inpark.Tenants.Features;

public static class SaveService
{
    public record Command(
        string ServiceId,
        Guid TenantId,
        List<ServiceFeature> Features
    ) : IRequest<OneOf<Response, TenantNotFound>>;

    public record ServiceFeature(
        string FeatureId,
        string Data
    );

    public class CommandValidator : AbstractValidator<Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.ServiceId).NotEmpty();
            RuleFor(x => x.TenantId).NotEmpty();

            RuleForEach(x => x.Features).ChildRules(feature =>
            {
                feature.RuleFor(x => x.FeatureId).NotEmpty();
                feature.RuleFor(x => x.Data).NotEmpty();
            });
        }
    }

    public class ServiceHandler : IRequestHandler<Command, OneOf<Response, TenantNotFound>>
    {
        private readonly TenantDbContext _context;

        public ServiceHandler(TenantDbContext context)
        {
            _context = context;
        }

        public async Task<OneOf<Response, TenantNotFound>> Handle(Command request, CancellationToken cancellationToken)
        {
            var tenant = await _context.Tenants
                .Include(x => x.Services)
                .ThenInclude(x => x.Features)
                .FirstOrDefaultAsync(t => t.Id == request.TenantId, cancellationToken);
            if (tenant is null) return new TenantNotFound(request.TenantId);

            var service = FindService(tenant, request.ServiceId);
            var serviceWasNull = service is null;
            if (serviceWasNull)
            { 
                service = CreateService(tenant, request);
            }

            foreach (var serviceFeature in request.Features)
            {
                UpdateOrCreateFeature(service!, serviceFeature);
            }

            await _context.SaveChangesAsync(cancellationToken);

            return new Response(serviceWasNull ? service!.ServiceId : null);
        }

        private Service CreateService(Tenant tenant, Command request)
        {
            var service = Service.Create(
                Guid.NewGuid(),
                request.ServiceId,
                new()
            );

            tenant.AddService(service);

            _context.Entry(service).State = EntityState.Added;

            return service;
        }

        private void UpdateOrCreateFeature(Service service, ServiceFeature serviceFeature)
        {
            var feature = service.Features.FirstOrDefault(x => x.FeatureId == serviceFeature.FeatureId);
            if (feature is null)
            {
                feature = Feature.Create(
                    Guid.NewGuid(),
                    serviceFeature.FeatureId,
                    serviceFeature.Data
                );
                service.AddFeature(feature);

                _context.Entry(feature).State = EntityState.Added;

                return;
            }

            feature.UpdateData(serviceFeature.Data);

            _context.Entry(feature).State = EntityState.Modified;
        }

        private static Service? FindService(Tenant? tenant, string serviceId)
            => tenant?.Services.FirstOrDefault(x => x.ServiceId == serviceId);
    }

    public record Request(
        string ServiceId,
        List<ServiceFeature> Features
    );

    public record Response(string? ServiceId);
}

[ApiController]
[MethodGroup(Groups.Tenant)]
public partial class SaveServiceController : ZooController
{
    private readonly IMediator _mediator;

    public SaveServiceController(IMediator mediator)
    {
        _mediator = mediator;
    }
    
    /// <summary>
    /// Saves a services config to a tenant.
    /// </summary>
    [HttpPost("tenants/{tenantId:guid}/services")]
    [SuccessResponse(typeof(SaveService.Response), (int)HttpStatusCode.Created)]
    [SuccessResponse(typeof(SaveService.Response), (int)HttpStatusCode.NoContent)]
    public async partial Task<ActionResult> SaveService([FromRoute] Guid tenantId, [FromBody] SaveService.Request request, 
        CancellationToken cancellationToken)
    {
        var command = new SaveService.Command(request.ServiceId, tenantId, request.Features);
        var result = await _mediator.Send(command, cancellationToken);

        return Map(result)
            .When<SaveService.Response>(resp =>
                resp.ServiceId is not null
                    ? CreatedAtAction<GetServiceController>(x =>
                        x.GetService(tenantId, resp.ServiceId))
                    : NoContent());
    }
}

    
