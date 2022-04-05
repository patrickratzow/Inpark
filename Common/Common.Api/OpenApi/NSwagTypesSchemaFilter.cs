using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public class NSwagTypesSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema model, SchemaFilterContext context)
    {
        // Only applies to v1
        if (context.DocumentName is not "v1") return;
        
        var type = Nullable.GetUnderlyingType(context.Type) ?? context.Type;
        if (type == typeof(decimal))
        {
            model.Format = "decimal";
        }
    }
}