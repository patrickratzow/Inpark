namespace Zeta.UI;

public class Text : SDUINode
{
    public Text(string? innerText = null) : base("Text")
    {
        if (string.IsNullOrEmpty(innerText)) return;
        
        SetText(innerText);
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