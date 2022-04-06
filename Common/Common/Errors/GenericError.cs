namespace Zoo.Common;

public class GenericError : IError
{
    private readonly string? _errorMessage;

    public GenericError(string? errorMessage)
    {
        _errorMessage = errorMessage;
    }

    public string? ErrorMessage => _errorMessage ?? "An error occured";
}