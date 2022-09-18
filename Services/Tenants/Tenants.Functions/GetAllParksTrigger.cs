using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Zeta.Common.Api;
using Zeta.Inpark.Tenants.Features;

namespace Zeta.Inpark.Tenants.Functions;

public class GetAllParksTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public GetAllParksTrigger(IResponseMapper mapper, IMediator mediator) : base(mapper)
    {
        _mediator = mediator;
    }
    
    [Function("get-all-parks")]
    public async Task<ActionResult> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get")] HttpRequest req)
    {
        var query = new GetAllParksQuery();
        var result = await _mediator.Send(query);

        return Map(result);
    }
}