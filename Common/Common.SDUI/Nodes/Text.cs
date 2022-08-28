namespace Zeta.Inpark.Common.SDUI;

public class Text : SDUINode
{
    public Text(string innerText, bool shouldTranslate = true) : base("Text")
    {
        SetText(innerText, shouldTranslate);
    }

    public void SetStyle(TextStyle style)
    {
        SetAttribute("style", style.ToCamelCase());
    }

    public void SetWeight(TextWeight weight)
    {
        var value = weight switch
        {
            TextWeight.Bold => "bold",
            TextWeight.Normal => "500",
            TextWeight.Light => "400",
            _ => weight.ToCamelCase()
        };
        
        SetAttribute("weight", value);
    }
}