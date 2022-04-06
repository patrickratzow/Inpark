using Microsoft.AspNetCore.Mvc;

namespace Zoo.Common.Api;

public interface IResponseMappingWhenOperation
{
    public IActionResult Run(object response);
}