using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zeta.Common.Api;

public class FixRequestBodyNullableReferencesSchemaFilter : IRequestBodyFilter
{
    public void Apply(OpenApiRequestBody requestBody, RequestBodyFilterContext context)
    {
        var content = requestBody.Content;
        foreach (var mediaType in content.Values)
        {
            var schema = mediaType.Schema;
            if (schema is not { AllOf.Count: 1, Reference: null }) continue;
            
            requestBody.Required = true;
                
            break;
        }
    }
}