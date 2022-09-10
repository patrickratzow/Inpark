using System.Text.Json;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class ImageParser : Parser
{
    public ImageParser(JsonElement element) : base(element)
    {
    }
    
    public override bool ShouldParse() => IsType("image");

    public override IntermediateNode Parse()
    {
        NotNull("alt", out string? alt);
        NotNull("image", out string? url);

        Validate();
        
        return new ImageNode(
            url!,
            alt,
            true    
        );
    }
}