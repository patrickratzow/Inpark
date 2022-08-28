namespace Zeta.Inpark.Common.SDUI;

// ReSharper disable once InconsistentNaming
public abstract class SDUIAction
{
    public abstract string Id { get; }
    public abstract string Data { get; }
    public abstract bool DataIsAttribute { get; }
}