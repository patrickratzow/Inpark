namespace Zeta.Inpark.Common.SDUI;

public class OpenUrlAction : SDUIAction
{
    public override string Id => "openUrl";
    public override string Data { get; }
    public override bool DataIsAttribute => true;
    
    public OpenUrlAction(string url)
    {
        Data = url;
    }
}