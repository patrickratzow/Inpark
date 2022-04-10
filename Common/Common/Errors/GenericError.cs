namespace Zoo.Common;

public sealed class GenericError : IError
{
    public string ErrorMessage { get; }

    public GenericError(string errorMessage)
    {
        ErrorMessage = errorMessage;
    }
}