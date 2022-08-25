namespace Zeta.Inpark.Common.SDUI.Nodes;

public class Navbar : SDUINode
{
    public Navbar() : base("Navbar")
    {
    }
    
    public void AddTab(Navtab tab)
    {
        AddChild(tab);
    }
}