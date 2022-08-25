namespace Zeta.Inpark.Common.SDUI.Nodes;

public class Text : SDUINode
{
    public Text(string innerText, bool shouldTranslate = true) : base("Text")
    {
        SetText(innerText, shouldTranslate);
    }
}