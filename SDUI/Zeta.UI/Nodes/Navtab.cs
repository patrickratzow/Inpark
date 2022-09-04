namespace Zeta.UI;

public class Navtab : SDUINode
{
    public Navtab(string text, string icon) : base("Navtab")
    {
        var child = new Text(text);
        child.SetParent(this);
        
        SetAttribute("icon", icon);
    }
}