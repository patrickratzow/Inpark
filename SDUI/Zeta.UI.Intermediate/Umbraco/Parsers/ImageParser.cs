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
        Get("width", out int? width);
        Get("height", out int? height);
        
        Validate();

        var metadata = new ImageMetadata(
            width,
            height
        );
        return new ImageNode(
            url!,
            alt,
            metadata
        );
    }
}