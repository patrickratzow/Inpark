using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public class ValidationErrorDescriptionOperationFilter : IOperationFilter
{
    public void Apply(OpenApiOperation operation, OperationFilterContext context)
    {
        var responses = operation.Responses;
        if (!responses.TryGetValue("422", out var validationError)) return;

        validationError.Description = "Request validation error";
    }
}