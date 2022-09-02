namespace Zeta.Inpark.Common.SDUI;

public class RichText : SDUINode
{
    public RichText() : base("RichText")
    {
    }

    public override void AddChild(SDUINode child)
    {
        if (child is not TextSpan) throw new ArgumentException("Must be a TextSpan", nameof(child));
        
        base.AddChild(child);
    }
}