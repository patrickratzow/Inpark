using System.Net;
using FluentValidation;
using MediatR;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Maps.Features;
using Zeta.Inpark.Maps.Functions.Extensions;

namespace Zeta.Inpark.Maps.Functions.Features;

public class PingLocationTrigger
{
    private readonly IMediator _mediator;
    private readonly ILogger _logger;

    public PingLocationTrigger(ILoggerFactory loggerFactory, IMediator mediator)
    {
        _mediator = mediator;
        _logger = loggerFactory.CreateLogger<PingLocationTrigger>();
    }

    [Function("ping-location")]
    public async Task<HttpResponseData> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post")] HttpRequestData req)
    {
        var request = await req.FromJsonBody<Request>();
        var userId = req.GetUserId();
        
        var command = new PingLocation.Command(userId, request.Latitude, request.Longitude);
        var result = await _mediator.Send(command);
        
        var response = req.CreateResponse(HttpStatusCode.OK);
        response.Headers.Add("Content-Type", "text/plain; charset=utf-8");

        response.WriteString("Welcome to Azure Functions!");

        return response;
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

/*
public class PingLocationTrigger
{
    private readonly IMediator _mediator;
    private readonly IResponseMapper _mapper;

    public PingLocationTrigger(IMediator mediator, IResponseMapper mapper)
    {
        _mediator = mediator;
        _mapper = mapper;
    }

    [Function("PingLocation")]
    public async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Anonymous, "post", Route = null)] HttpRequest req, 
        ILogger log)
    {
        var request = await req.FromJsonBody<Request>();
        var userId = req.GetUserId();
        
        var command = new PingLocation.Command(userId, request.Latitude, request.Longitude);
        var result = await _mediator.Send(command);

        return _mapper.Map(result)
            .Build();
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
}*/