using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public class EnumSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema model, SchemaFilterContext context)
    {
        var typeInfo = context.Type;
        if (!typeInfo.IsEnum || model.Extensions.ContainsKey("x-enumNames")) return;
        
        // Unwrap the allOf construct
        // Remove when https://github.com/epam-cross-platform-lab/swagger-dart-code-generator/issues/392 is fixed
        if (model.AllOf.Any())
        {
            model.Reference = model.AllOf.First().Reference;
            model.AllOf = null;
        }
        
        var names = Enum.GetNames(context.Type);
        var arr = new OpenApiArray();
        arr.AddRange(names.Select(name => new OpenApiString(name)));
        model.Extensions.Add("x-enumNames", arr);
    }
}