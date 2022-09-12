namespace Zeta.UI.Intermediate.Validation;

public class ParsingValidationException : Exception
{
    public IReadOnlyCollection<Exception> Exceptions { get; }
    
    public ParsingValidationException(IReadOnlyCollection<Exception> exceptions, Parser parser) 
        : base($"{parser.GetType().Name} was not able to parse the given input due to validation errors. See inner exceptions for details.")
    {
        Exceptions = exceptions;
    }
}