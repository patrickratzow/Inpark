namespace Zeta.Common;

public sealed class PropertyError : IError
{
    public string PropertyName { get; }
    public string ErrorMessage { get; }
    
    public PropertyError(string propertyName, string errorMessage)
    {
        PropertyName = propertyName;
        ErrorMessage = errorMessage;
    }
}
