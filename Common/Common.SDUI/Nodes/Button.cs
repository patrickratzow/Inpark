using Zeta.Inpark.Common.SDUI.ButtonActions;

namespace Zeta.Inpark.Common.SDUI.Nodes;

public class Button : SDUINode
{
    public Button(ButtonAction action) : base("Button")
    {
        SetAttribute("action", action.Id);
        if (action.DataIsAttribute)
        {
            SetAttribute("action-data", action.Data);
        }
        else
        {
            var node = new SDUINode("ActionData");
            node.SetText($"<![CDATA[{action.Data}]]>", false);
        }
    }
}