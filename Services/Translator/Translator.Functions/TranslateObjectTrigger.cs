using System.Net;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Enums;
using Zeta.Common.Api;
using Zeta.Inpark.Translator.Features;
using Zeta.Inpark.Translator.Functions.Extensions;

namespace Zeta.Inpark.Translator.Functions;

public class TranslateObjectTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public TranslateObjectTrigger(IMediator mediator, IResponseMapper mapper) : base(mapper)
    {
        _mediator = mediator;
    }

    [Function("translate-object")]
    [OpenApiOperation(
        operationId: "translate-object", 
        tags: new[] { "translate" }, 
        Summary = "Translates object",
        Visibility = OpenApiVisibilityType.Important
    )]
    [OpenApiRequestBody(
        contentType: "application/json", 
        bodyType: typeof(Request), 
        Required = true, 
        Description = "Translated object"
    )]
    [OpenApiResponseWithBody(
        statusCode: HttpStatusCode.OK, 
        contentType: "application/json", 
        bodyType: typeof(Dictionary<string, string>), 
        Summary = "successful operation", 
        Description = "successful operation"
    )]
    public async Task<ActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "post")] HttpRequestData req)
    {
        var request = await req.FromJsonBody<Request>();
        var userId = req.GetUserId();
        
        var command = new TranslateObject.Query(
            userId,
            request.To,
            request.Input,
            request.Properties
        );
        var result = await _mediator.Send(command);

        return Map(result);
    }

    public record Request(
        string To,
        Dictionary<string, string> Input,
        HashSet<string> Properties
    );
}