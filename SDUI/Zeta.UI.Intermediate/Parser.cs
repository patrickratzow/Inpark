using System.Runtime.CompilerServices;
using System.Text.Json;

namespace Zeta.UI.Intermediate;

public abstract class Parser
{
    protected JsonElement Element;
    private readonly ValidationBuilder _validationBuilder;

    protected Parser(JsonElement element)
    {
        Element = element;
        _validationBuilder = new(this);
    }
    
    public abstract bool ShouldParse();
    public abstract IntermediateNode Parse();
    
    protected bool IsType(string type)
    {
        return Element.TryGetProperty("type", out var typeValue) && typeValue.ToString() == type;
    }
    
    protected void NotNull<T>(string propertyName, out T? value, 
        [CallerArgumentExpression("value")] string? name = null)
    {
        value = Get<T>(propertyName);

        _validationBuilder.NotNull(value, name);
    }
    
    protected void NotEmpty<T>(string propertyName, out T? value, 
        [CallerArgumentExpression("value")] string? name = null)
    {
        value = Get<T>(propertyName);

        _validationBuilder.NotEmpty(value, name);
    }

    protected void Validate() => _validationBuilder.Validate();

    private T? Get<T>(string propertyName)
    {
        if (!Element.TryGetProperty(propertyName, out var property))
            return default;

        var genericType = typeof(T);
        var type = genericType.IsGenericType && genericType.GetGenericTypeDefinition() == typeof(Nullable<>)
                ? Nullable.GetUnderlyingType(genericType)
                : genericType;
        if (type == typeof(string))
        {
            return (T) (object) property.GetString()!;
        }

        throw new NotImplementedException($"Has not implemented type {type!.Name}");
    }
    
}