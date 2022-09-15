using System.Net;
using FluentValidation;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;
using Microsoft.Azure.Functions.Worker.Middleware;

namespace Zeta.Inpark.Tenants.Functions.Middleware;

public class FluentValidationMiddleware : IFunctionsWorkerMiddleware
{
    private record ValidationError(
        string PropertyName, 
        string Value
    );
    
    public async Task Invoke(FunctionContext context, FunctionExecutionDelegate next)
    {
        try
        {
            await next(context);
        }
        catch (Exception ex) when (ex.InnerException is ValidationException e)
        {
            var req = await context.GetHttpRequestDataAsync();
            var res = req!.CreateResponse();
            var errors = e.Errors
                .Select(x => new ValidationError(
                    x.PropertyName,
                    x.ErrorMessage
                ));
            await res.WriteAsJsonAsync(errors, HttpStatusCode.BadRequest);

            context.GetInvocationResult().Value = res;
        }
    }
}