using System.Text.Json;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class CallToActionParser : Parser
{
    public CallToActionParser(JsonElement element) : base(element)
    {
    }
    
    public override bool ShouldParse() => IsType("callToAction");

    public override IntermediateNode Parse()
    {
        NotNull("externalPage", out string? url);
        NotNull("linkButtonText", out string? text);

        Validate();

        return new CallToActionNode(url!, text!);
    }
}