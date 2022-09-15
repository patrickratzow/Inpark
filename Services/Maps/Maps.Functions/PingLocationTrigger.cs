using FluentValidation;
using MediatR;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Zeta.Common.Api;
using Zeta.Inpark.Maps.Features;
using Zeta.Inpark.Maps.Functions.Extensions;

namespace Zeta.Inpark.Maps.Functions;

public class PingLocationTrigger : HttpTrigger
{
    private readonly IMediator _mediator;

    public PingLocationTrigger(
        IMediator mediator, 
        IResponseMapper responseMapper) : base(responseMapper)
    {
        _mediator = mediator;
    }

    [Function("ping-location")]
    public async Task<HttpResponseData> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "post")] HttpRequestData req)
    {
        var request = await req.FromJsonBody<Request>();
        var userId = req.GetUserId();
        
        var command = new QueuePingLocation.Command(userId, request.Latitude, request.Longitude);
        var result = await _mediator.Send(command);

        return MapResponse(req, result);
    }
    
    public record Request(
        double Latitude,
        double Longitude
    );

    public class RequestValidator : AbstractValidator<Request>
    {
        public RequestValidator()
        {
            RuleFor(x => x.Latitude)
                .NotEmpty()
                .GreaterThanOrEqualTo(-90)
                .LessThanOrEqualTo(90);
            RuleFor(x => x.Longitude)
                .NotEmpty()
                .GreaterThanOrEqualTo(-180)
                .LessThanOrEqualTo(180);
        }
    }
}