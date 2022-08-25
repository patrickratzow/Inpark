namespace Zeta.Inpark.Common.SDUI.Nodes;

public class Navtab : SDUINode
{
    public Navtab(string text, string icon) : base("Navtab")
    {
        SetAttribute("text", $"z-translate({text})");
        SetAttribute("icon", icon);
    }
}