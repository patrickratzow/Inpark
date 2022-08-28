namespace Zeta.Inpark.Common.SDUI;

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