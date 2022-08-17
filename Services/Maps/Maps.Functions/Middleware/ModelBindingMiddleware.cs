using System.Net;
using System.Text.Json;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.Functions.Worker.Middleware;

namespace Zeta.Inpark.Maps.Functions.Middleware;

public class ModelBindingMiddleware : IFunctionsWorkerMiddleware
{
    public async Task Invoke(FunctionContext context, FunctionExecutionDelegate next)
    {
        try
        {
            await next(context);
        }
        catch (Exception ex) when (ex.InnerException is JsonException e)
        {
            var req = await context.GetHttpRequestDataAsync();
            var res = req!.CreateResponse();
            await res.WriteAsJsonAsync(new { Error = e.Message }, HttpStatusCode.BadRequest);

            context.GetInvocationResult().Value = res;
        }
    }
}