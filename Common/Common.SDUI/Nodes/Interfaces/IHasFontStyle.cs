namespace Zeta.Inpark.Common.SDUI;

public interface IHasFontStyle
{
}

public static class HasFontStyleExtensions
{
    public static void SetFontStyle(
        this IHasTextStyle sduiNode,  
        FontStyle fontStyle, 
        string key = "font-style")
    {
        if (sduiNode is not SDUINode node) return;

        node.SetAttribute(key, fontStyle switch
        {
            FontStyle.Normal => "normal",
            FontStyle.Italic => "italic",
            _ => throw new ArgumentOutOfRangeException(nameof(fontStyle), fontStyle, null)
        });

        node.SetInternalData("font-style", key, fontStyle);
    }
    
    public static InternalData<FontStyle>? GetFontStyle(this IHasTextStyle sduiNode)
    {
        if (sduiNode is not SDUINode node) return null;

        return node.GetInternalData<FontStyle>("font-style");
    }
}