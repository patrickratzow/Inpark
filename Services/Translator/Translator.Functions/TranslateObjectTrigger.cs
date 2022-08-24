using MediatR;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Zeta.Inpark.Translator.Features;
using Zeta.Inpark.Translator.Functions.Extensions;
using Zoo.Common.Api;

namespace Zeta.Inpark.Translator.Functions;

public class TranslateObjectTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public TranslateObjectTrigger(
        IMediator mediator, 
        IResponseMapper responseMapper) : base(responseMapper)
    {
        _mediator = mediator;
    }

    [Function("translate-object")]
    public async Task<HttpResponseData> Run(
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

        return MapResponse(req, result);
    }

    public record Request(
        string To,
        Dictionary<string, string> Input,
        HashSet<string> Properties
    );
}