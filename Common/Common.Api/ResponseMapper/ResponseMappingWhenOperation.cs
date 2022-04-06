using Microsoft.AspNetCore.Mvc;

namespace Zoo.Common.Api;

public class ResponseMappingWhenOperation<T> : IResponseMappingWhenOperation
{
    private readonly Func<T, IActionResult> _func;

    public ResponseMappingWhenOperation(Func<T, IActionResult> func)
    {
        _func = func;
    }

    public IActionResult Run(object response) => _func((T) response);
}