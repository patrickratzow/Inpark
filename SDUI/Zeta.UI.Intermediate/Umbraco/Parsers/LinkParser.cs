using System.Text.Json;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class LinkParser : IParser
{
    public ValueTask<bool> ShouldParse(JsonElement json)
        => new(json.GetElementType() is "callToAction");

    public ValueTask<IntermediateNode> Parse(JsonElement json)
    {
        var url = json.GetProperty("externalPage").ToString();
        var text = json.GetProperty("linkButtonText").ToString();

        var node = new LinkNode(url, text);
        return new(node);
    }
}