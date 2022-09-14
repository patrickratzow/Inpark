using System.Text.Json;
using System.Text.RegularExpressions;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate.Umbraco.Parsers;

public class TextParser : Parser
{
    private static readonly Regex Regex = 
        new(@"<(.+)>(.*)</(.+)>", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
    
    public TextParser(JsonElement element) : base(element)
    {
    }

    public override bool ShouldParse() => IsType("text") || IsType("header") || IsType("headline");

    public override IntermediateNode Parse()
    {
        NotEmpty("text,header", out string? text);
        NotEmpty("type", out string? type);
        
        Validate();

        var kind = Regex.IsMatch(text!) 
            ? TextKind.Html 
            : TextKind.Text;
        
        return new TextNode(text!, kind, type is "header");
    }
}