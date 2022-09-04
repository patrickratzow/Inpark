namespace Zeta.UI;

public interface IHasTextStyle
{
}

public static class HasTextStyleExtensions
{
    public static void SetTextStyle(
        this IHasTextStyle sduiNode,  
        TextStyle textStyle, 
        string key = "style")
    {
        if (sduiNode is not SDUINode node) return;

        node.SetAttribute(key, textStyle.ToCamelCase());

        node.SetInternalData("text-style", key, textStyle);
    }
    
    public static InternalData<TextStyle>? GetTextStyle(this IHasTextStyle sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;

        return node.GetInternalData<TextStyle>("text-style");
    }
}