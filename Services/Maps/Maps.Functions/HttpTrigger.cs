using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker.Http;
using OneOf;
using System.Net;
using System.Text;
using System.Text.Json;
using Zoo.Common.Api;

namespace Zeta.Inpark.Maps.Functions;

public abstract class HttpTrigger
{
    private readonly IResponseMapper _responseMapper;

    protected HttpTrigger(IResponseMapper responseMapper)
    {
        _responseMapper = responseMapper;
    }

    protected HttpResponseData MapResponse<T0>(HttpRequestData requestData, OneOf<T0> oneOf) {
        var response = CreateResponse(requestData);
        var result = _responseMapper.Map(oneOf).Build();

        MapToResult(response, result);

        return response;
    }

    private static HttpResponseData CreateResponse(HttpRequestData requestData)
    {
        var response = requestData.CreateResponse();
        response.Headers.Add("Content-Type", "text/json; charset=utf-8");

        return response;
    }

    private static void MapToResult(HttpResponseData response, IActionResult result)
    {
        response.StatusCode = result switch
        {
            OkResult or OkObjectResult => HttpStatusCode.OK,
            CreatedResult => HttpStatusCode.Created,
            AcceptedResult => HttpStatusCode.Accepted,
            NoContentResult => HttpStatusCode.NoContent,
            BadRequestResult or BadRequestObjectResult => HttpStatusCode.BadRequest,
            NotFoundResult or NotFoundObjectResult => HttpStatusCode.NotFound,
            ConflictResult or ConflictObjectResult => HttpStatusCode.Conflict,
            _ => response.StatusCode
        };

        if (result is ObjectResult obj)
        {
            var json = JsonSerializer.Serialize(obj.Value);
            var utf8 = Encoding.UTF8.GetBytes(json);
            var buffer = new byte[utf8.Length];
            var body = new MemoryStream(buffer);
            body.Write(utf8);

            response.Body = body;
        }
    }
}
