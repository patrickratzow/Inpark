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
        
        var names = Enum.GetNames(context.Type);
        var arr = new OpenApiArray();
        arr.AddRange(names.Select(name => new OpenApiString(name)));
        
        model.Extensions.Add("x-enumNames", arr);
    }
}