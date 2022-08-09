using Zeta.Inpark.Auth.Services;
using Zoo.Common.Api.SourceGenerator.Attributes.OpenApi;

namespace Zeta.Inpark.Auth.Features.Admin;

public class IsTokenValid
{
    public record Query(string Token) : IRequest<OneOf<Unit, InvalidToken, ExpiredToken>>;
    
    public class QueryValidator : AbstractValidator<Query>
    {
        public QueryValidator()
        {
            RuleFor(x => x.Token).NotEmpty();
        }
    }
    
    public class Handler : IRequestHandler<Query, OneOf<Unit, InvalidToken, ExpiredToken>>
    {
        private readonly JwtService _jwtService;

        public Handler(JwtService jwtService)
        {
            _jwtService = jwtService;
        }

#pragma warning disable CS1998
        public async Task<OneOf<Unit, InvalidToken, ExpiredToken>> Handle(Query request, CancellationToken cancellationToken)
#pragma warning restore CS1998
        {
            var response = _jwtService.IsValid(request.Token);
            
            return response switch
            {
                JwtService.JwtValidationResult.Valid => Unit.Value,
                JwtService.JwtValidationResult.Invalid => new InvalidToken(),
                JwtService.JwtValidationResult.Expired => new ExpiredToken(),
                _ => throw new ArgumentOutOfRangeException()
            };
        }
    }

    public record InvalidToken : IValidationError
    {
        public string ErrorMessage => "Invalid token";
    }

    public record ExpiredToken : INotFoundError
    {
        public string ErrorMessage => "Expired token";
    }
}

[ApiController]
[MethodGroup(Groups.Admins)]
public partial class IsTokenValidController : ZooController
{
    private readonly IMediator _mediator;

    public IsTokenValidController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet("auth/admin/is-token-valid/{token}")]
    [SuccessResponse(200)]
    public async partial Task<ActionResult> IsTokenValid(string token, CancellationToken cancellationToken)
    {
        var query = new IsTokenValid.Query(token);
        var result = await _mediator.Send(query, cancellationToken);

        return Map(result)
            .When<Unit>(_ => Ok());
    }
}
