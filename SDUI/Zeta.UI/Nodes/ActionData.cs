namespace Zeta.UI;

public class ActionData : SDUINode
{
    public ActionData() : base("ActionData")
    {
        ShouldNotTranslate();
    }

    public void SetData(string data)
    {
        SetText($"<![CDATA[{data}]]>");
    }
}