namespace Zeta.Inpark.Common.SDUI;

public class GestureDetector : SDUINode, IHasAction
{
    public GestureDetector() : base("GestureDetector")
    {
    }

    public void OnTap(SDUIAction action)
    {
        this.SetAction("on-tap", action);
    }
}