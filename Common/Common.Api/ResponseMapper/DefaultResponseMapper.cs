using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Zeta.Common.Api;

public class DefaultResponseMapper : IResponseMapper
{
    IActionResult IResponseMapper.MapResponse<TResponse>(TResponse response) =>
        response switch
        {
            INotFoundError => GetResult<NotFoundResult, NotFoundObjectResult>(response),
            IValidationError => GetResult<BadRequestResult, BadRequestObjectResult>(response),
            IAlreadyExistsError => GetResult<ConflictResult, ConflictObjectResult>(response),
            IError => throw new ArgumentException(
                $"Unable to find an error handler for {response.GetType().Name}"),
            Unit => new NoContentResult(),
            _ => GetResult<OkResult, OkObjectResult>(response)
        };

    private static IActionResult GetResult<TCodeResult, TObjectResult>(object? data)
        where TCodeResult : StatusCodeResult
        where TObjectResult : ObjectResult
    {
        return (data is null
            ? Activator.CreateInstance(typeof(TCodeResult)) as IActionResult
            : Activator.CreateInstance(typeof(TObjectResult), data) as IActionResult)!;
    }

    private static IActionResult GetGenericResult(object? data, int statusCode)
    {
        if (data is null) return new StatusCodeResult(statusCode);
        
        return new ObjectResult(data)
        {
            StatusCode = statusCode
        };
    }
}