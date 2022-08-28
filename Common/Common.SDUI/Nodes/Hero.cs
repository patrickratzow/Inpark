namespace Zeta.Inpark.Common.SDUI;

public class Hero : SDUINode
{
    public Hero(string tag) : base("Hero")
    {
        SetAttribute("tag", tag);
    }
}