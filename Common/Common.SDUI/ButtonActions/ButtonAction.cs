namespace Zeta.Inpark.Common.SDUI.ButtonActions;

public abstract class ButtonAction
{
    public abstract string Id { get; }
    public abstract string Data { get; }
    public abstract bool DataIsAttribute { get; }
}