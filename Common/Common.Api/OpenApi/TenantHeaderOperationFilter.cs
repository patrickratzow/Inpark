using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public class TenantHeaderOperationFilter : IOperationFilter
{
    public void Apply(OpenApiOperation operation, OperationFilterContext context)
    {
        operation.Parameters.Add(new()
        {
            Name = "X-Tenant",
            Description = "Tenant",
            In = ParameterLocation.Header,
            Required = false,
            Schema = new()
            {
                Type = "string",
                Default = new OpenApiString("99348443-55F7-4104-83CB-031D29D95A14")
            }
        });

    }
}