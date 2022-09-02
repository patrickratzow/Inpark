namespace Zeta.Inpark.Common.SDUI;

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