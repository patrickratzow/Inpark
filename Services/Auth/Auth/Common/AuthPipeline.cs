using System.Reflection;
using Zeta.Inpark.Auth.Services;

namespace Zeta.Inpark.Auth.Common;

public class AuthPipeline<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
    where TRequest : IRequest<TResponse>
{
    private readonly IJwtService _jwtService;
    private readonly IHttpContextAccessor _accessor;
    
    public AuthPipeline(IJwtService jwtService, IHttpContextAccessor accessor)
    {
        _jwtService = jwtService;
        _accessor = accessor;
    }

    public async Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken,
        RequestHandlerDelegate<TResponse> next)
    {
        var authAttribute = request.GetType().GetCustomAttribute<AuthAttribute>();
        if (authAttribute is null) return await next();
        var authHeader = _accessor.HttpContext?.Request.Headers["Authorization"].ToString();
        if (authHeader is null) throw new InvalidOperationException("Token not found");
        var authHeaderSplit = authHeader.Split("Bearer");
        if (authHeaderSplit.Length != 2) throw new InvalidOperationException("Invalid auth header");
        
        var token = authHeaderSplit[1].Trim();
        var tokenStatus = _jwtService.IsValid(token);

        return tokenStatus switch
        {
            JwtService.JwtValidationResult.Invalid => throw new InvalidOperationException("Invalid token"),
            JwtService.JwtValidationResult.Expired => throw new InvalidOperationException("Token expired"),
            _ => await next()
        };

    }
}