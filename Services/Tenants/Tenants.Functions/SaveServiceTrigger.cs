using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Zeta.Common.Api;
using Zeta.Inpark.Tenants.Features;
using Zeta.Inpark.Tenants.Functions.Extensions;

namespace Zeta.Inpark.Tenants.Functions;

public class SaveServiceTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public SaveServiceTrigger(IResponseMapper responseMapper, IMediator mediator) : base(responseMapper)
    {
        _mediator = mediator;
    }
    
    [Function("save-service")]
    public async Task<ActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "post", Route = "service/{tenantId}")] HttpRequestData req,
        Guid tenantId
        )
    {
        var request = await req.FromJsonBody<Request>();
        
        var command = new SaveService.Command(
            request.ServiceId,
            tenantId,
            request.Features.Select(x => new SaveService.ServiceFeature(x.FeatureId, x.Data)).ToList()
        );
        var result = await _mediator.Send(command);

        return Map(result);
    }

    public record Request(
        string ServiceId,
        List<RequestFeature> Features
    );
    
    public record RequestFeature(
        string FeatureId,
        string Data
    );
}