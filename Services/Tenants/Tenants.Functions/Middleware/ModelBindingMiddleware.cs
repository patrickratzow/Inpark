using System.Net;
using System.Text.Json;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.Functions.Worker.Middleware;

namespace Zeta.Inpark.Tenants.Functions.Middleware;

public class ModelBindingMiddleware : IFunctionsWorkerMiddleware
{
    private record ModelBindingError(
        string Error
    );
    
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
            var error = new ModelBindingError(e.Message);
            await res.WriteAsJsonAsync(error, HttpStatusCode.BadRequest);

            context.GetInvocationResult().Value = res;
        }
    }
}