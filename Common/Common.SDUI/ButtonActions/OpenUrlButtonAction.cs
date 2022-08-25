namespace Zeta.Inpark.Common.SDUI.ButtonActions;

public class OpenUrlButtonAction : ButtonAction
{
    public override string Id => "openUrl";
    public override string Data { get; }
    public override bool DataIsAttribute => true;
    
    public OpenUrlButtonAction(string url)
    {
        Data = url;
    }
}