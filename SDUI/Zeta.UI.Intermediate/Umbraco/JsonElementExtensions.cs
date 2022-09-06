using System.Text.Json;

namespace Zeta.UI.Intermediate.Umbraco;

public static class JsonElementExtensions
{
    public static string? GetElementType(this JsonElement element)
    {
        return element.TryGetProperty("type", out var type) 
            ? type.ToString() 
            : null;
    }
}