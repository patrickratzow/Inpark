namespace Zeta.Inpark.Common.SDUI;

public class Button : SDUINode, IHasAction
{
    public Button(SDUIAction action) : base("Button")
    {
        this.SetAction("action", action);
    }
}