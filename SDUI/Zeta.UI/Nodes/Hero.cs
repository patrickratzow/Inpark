namespace Zeta.UI;

public class Hero : SDUINode
{
    public Hero(string tag) : base("Hero")
    {
        SetAttribute("tag", tag);
    }
}