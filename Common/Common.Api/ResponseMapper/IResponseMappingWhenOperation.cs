using Microsoft.AspNetCore.Mvc;

namespace Zeta.Common.Api;

public interface IResponseMappingWhenOperation
{
    public IActionResult Run(object response);
}