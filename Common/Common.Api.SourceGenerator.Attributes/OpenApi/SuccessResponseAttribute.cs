namespace Zoo.Common.Api.SourceGenerator.Attributes.OpenApi;

[AttributeUsage(AttributeTargets.Method, AllowMultiple = true)]
public class SuccessResponseAttribute : Attribute
{
    private int _statusCode;
    private Type? _type;

    public SuccessResponseAttribute(int statusCode) { _statusCode = statusCode; }

    public SuccessResponseAttribute(Type type, int statusCode)
    {
        _statusCode = statusCode;
        _type = type;
    }
}