using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public class RequiredPropertiesSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema model, SchemaFilterContext context)
    {
        foreach (var (key, property) in model.Properties)
        {
            var propertyName = $"{key[..1].ToUpper()}{key[1..]}";
            var propertyInfo = context.Type.GetProperty(propertyName);
            if (propertyInfo is null) continue;
            var isNullable = Nullable.GetUnderlyingType(propertyInfo.PropertyType) is not null;
            if (isNullable) continue;

            model.Required.Add(key);
        }
    }
}