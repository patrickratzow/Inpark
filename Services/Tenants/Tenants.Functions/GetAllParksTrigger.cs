using System.Net;
using Azure.Core;
using MediatR;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
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
    [OpenApiOperation(
        operationId: "get-all-parks", 
        tags: new[] { "parks" }, 
        Summary = "Shows all parks",
        Visibility = OpenApiVisibilityType.Important
    )]
    [OpenApiResponseWithBody(
        statusCode: HttpStatusCode.OK, 
        contentType: "application/json", 
        bodyType: typeof(Dictionary<string, string>), 
        Summary = "successful operation", 
        Description = "successful operation"
    )]
    public async Task<HttpResponseData> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get")] HttpRequestData req)
    {
        var query = new GetAllParksQuery();
        var result = await _mediator.Send(query);

        return await Map(result).Build(req);
    }
}