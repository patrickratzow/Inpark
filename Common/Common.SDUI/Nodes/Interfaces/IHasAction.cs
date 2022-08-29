namespace Zeta.Inpark.Common.SDUI;

public interface IHasAction
{
}

public static class HasActionExtensions
{
    public static void SetAction(this IHasAction sduiNode, string key, SDUIAction action)
    {
        if (sduiNode is not SDUINode node) return;
        
        node.SetAttribute(key, action.Id);
        if (action.DataIsAttribute)
        {
            node.SetAttribute("action-data", action.Data);
        }
        else
        {
            var actionData = new SDUINode("ActionData");
            actionData.SetAttribute("class", "notranslate");
            actionData.SetText($"<![CDATA[{action.Data}]]>", false);
            actionData.SetParent(node);
        }

        node.SetInternalData("action", key, action);
    }

    public static InternalData<SDUIAction>? GetAction(this IHasAction sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;
        
        return node.GetInternalData<SDUIAction>("action");
    }
}