using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker.Http;

namespace Zeta.Common.Api;

public static class ResponseMappingBuilderExtensions
{
    public static Task<HttpResponseData> Build<T0>(this ResponseMappingBuilder<T0> builder, HttpRequestData req)
        => Unwrap(builder.Build(), req);

    private static async Task<HttpResponseData> Unwrap(IActionResult result, HttpRequestData req)
    {
        var response = req.CreateResponse();
        if (result is StatusCodeResult statusCodeResult) {
            response.StatusCode = (HttpStatusCode) statusCodeResult.StatusCode;
        }
        if (result is ObjectResult objectResult) {
            response.StatusCode = (HttpStatusCode) objectResult.StatusCode;
            await response.WriteAsJsonAsync(objectResult.Value);
        }

        return response;
    }
}