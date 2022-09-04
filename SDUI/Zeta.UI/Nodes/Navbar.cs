namespace Zeta.UI;

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