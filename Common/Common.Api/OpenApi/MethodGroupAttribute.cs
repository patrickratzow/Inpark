namespace Zeta.Common.Api;

public class MethodGroupAttribute : Attribute
{
    public MethodGroupAttribute(string name) { Name = name; }
    public string Name { get; }
}