using System.Runtime.CompilerServices;
using Zeta.UI.Intermediate.Umbraco;

namespace Zeta.UI.Intermediate.Validation;

public class ValidationBuilder
{
    private readonly List<Exception> _exceptions = new();
    private readonly Parser _parser;

    public ValidationBuilder(Parser parser)
    {
        _parser = parser;
    }

    public ValidationBuilder AddError(Exception exception)
    {
        _exceptions.Add(exception);

        return this;
    }

    public ValidationBuilder NotNull(object? value, [CallerArgumentExpression("value")] string? name = null)
    {
        if (value is not null) return this;
            
        return AddError(new ArgumentNullException(name));
    }
    
    public ValidationBuilder NotEmpty(object? value, [CallerArgumentExpression("value")] string? name = null)
    {
        if (value != default) return this;
        if (value is string s && !string.IsNullOrWhiteSpace(s)) return this;
        
        return AddError(new ArgumentException("Value cannot be empty.", name));
    }

    public void Validate()
    {
        if (!_exceptions.Any()) return;
        
        throw new ParsingValidationException(_exceptions, _parser);
    }
}