using System.Text.Json;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class LinkParser : IParser
{
    public ValueTask<bool> ShouldParse(JsonElement json)
        => new(json.GetElementType() is NodeTypes.Link)

    public ValueTask<IntermediateNode> Parse(JsonElement json)
    {
        throw new NotImplementedException();
    }
}