using System.Text.RegularExpressions;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Zoo.Common.Api;

public static class SwaggerGenOptionsExtensions
{
    public static void UseZooOptions(this SwaggerGenOptions options)
    {
        options.CustomSchemaIds(GetSchemaId);
        
        options.SchemaFilter<EnumSchemaFilter>();
        options.SchemaFilter<NSwagTypesSchemaFilter>();
        options.OperationFilter<ValidationErrorDescriptionOperationFilter>();
        options.RequestBodyFilter<FixRequestBodyNullableReferencesSchemaFilter>();
        options.SupportNonNullableReferenceTypes();
        options.UseAllOfToExtendReferenceSchemas();
    }

    private static readonly Regex SchemaIdRegex = new(@"(.*)`\d+\[(.*)\]", RegexOptions.Compiled);
    private static string GetSchemaId(Type type)
    {
        var name = type.ToString();
        if (!type.IsGenericType) return name;
        var regex = SchemaIdRegex.Match(name);
        if (!regex.Success) return name;

        var typeName = regex.Groups[1].Value;
        var genericNames = regex.Groups[2].Value.Split(",")
            .Select(x => x.Split(".").Last());

        return $"{typeName}Of{string.Join("And", genericNames)}";
    }
}