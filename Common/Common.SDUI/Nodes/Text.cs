namespace Zeta.Inpark.Common.SDUI.Nodes;

public class Text : SDUINode
{
    public Text(string innerText, bool shouldTranslate = true) : base("Text")
    {
        SetText(innerText, shouldTranslate);
    }

    public void SetStyle(TextStyle style)
    {
        SetAttribute("style", ConvertToCamelCase(style));
    }

    public void SetWeight(TextWeight weight)
    {
        var value = weight switch
        {
            TextWeight.Bold => "bold",
            TextWeight.Normal => "500",
            TextWeight.Light => "400",
            _ => ConvertToCamelCase(weight)
        };
        
        SetAttribute("weight", value);
    }
    
    private string ConvertToCamelCase<T>(T value) where T : struct, Enum
    {
        var enumName = Enum.GetName(value);
        var camelCase = enumName![..1].ToLower() + enumName[1..];

        return camelCase;
    }
}

public enum TextWeight
{
    Bold,
    Normal,
    Light
}

public enum TextStyle
{
    DisplayLarge,
    DisplayMedium,
    DisplaySmall,
    HeadlineLarge,
    HeadlineMedium,
    HeadlineSmall,
    TitleLarge,
    TitleMedium,
    BodyLarge,
    BodyMedium,
    BodySmall
}