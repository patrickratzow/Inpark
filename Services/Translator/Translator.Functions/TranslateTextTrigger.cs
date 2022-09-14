using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Zeta.Inpark.Translator.Features;
using Zeta.Inpark.Translator.Functions.Extensions;
using Zoo.Common.Api;

namespace Zeta.Inpark.Translator.Functions;

public class TranslateTextTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public TranslateTextTrigger(IMediator mediator, IResponseMapper mapper) : base(mapper)
    {
        _mediator = mediator;
    }

    [Function("translate-text")]
    public async Task<ActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "post")] HttpRequestData req)
    {
        var request = await req.FromJsonBody<Request>();
        var userId = req.GetUserId();
        
        var command = new TranslateText.Query(
            userId,
            request.To,
            request.Text
        );
        var result = await _mediator.Send(command);

        return Map(result);
    }

    public record Request(
        string To,
        string Text
    );
}