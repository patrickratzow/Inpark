using System.Threading.Tasks;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Maps.Features;
using Zeta.Inpark.Maps.Functions.Extensions;
using Zoo.Common.Api;

namespace Zeta.Inpark.Maps.Functions.Features;

public class PingLocationTrigger
{
    private readonly IMediator _mediator;
    private readonly IResponseMapper _mapper;

    public PingLocationTrigger(IMediator mediator, IResponseMapper mapper)
    {
        _mediator = mediator;
        _mapper = mapper;
    }

    [FunctionName("PingLocation")]
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
}