using MediatR;
using Microsoft.Extensions.Logging;

namespace Zoo.Common.Api.Pipelines;

public class LoggingPipeline<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
    where TRequest : IRequest<TResponse>
{
    private readonly ILogger<TRequest> _logger;

    public LoggingPipeline(ILogger<TRequest> logger)
    {
        _logger = logger;
    }

    public async Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken, 
        RequestHandlerDelegate<TResponse> next)
    {
        var requestName = request.GetType().Name;
        var scope = _logger.BeginScope("Request {Name}", requestName);

        try
        {
            var response = await next();

            if (response is null)
            {
                _logger.LogError("Returned a NULL response");
            }
            else
            {
                // We know that we get something back wrapped in IOneOf, but for sanity's sake lets check
                if (response is not IOneOf oneOf)
                {
                    _logger.LogError(
                        "Returned something that is not OneOf. The returned value was {Response}", response
                    );
                }
                else
                {
                    _logger.LogInformation("Returned {Name}", oneOf.Value.GetType().Name);
                }
            }


            return response;
        }
        catch (Exception ex)
        {
            _logger.LogError("An Exception was thrown. Exception: {Exception}", ex);
            
            throw;
        }
        finally
        {
            scope.Dispose();
        }
    }
}