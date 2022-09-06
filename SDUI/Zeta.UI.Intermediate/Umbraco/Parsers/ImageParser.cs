using System.Text.Json;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class ImageParser : IParser
{
    public ValueTask<bool> ShouldParse(JsonElement json) 
        => new(json.GetElementType() is "image");

    public ValueTask<IntermediateNode> Parse(JsonElement json)
    {
        var alt = json.GetProperty("alt").ToString();
        var url = json.GetProperty("image").ToString();
        
        var node = new ImageNode(
            url,
            alt,
            true    
        );
        return new(node);
    }
}