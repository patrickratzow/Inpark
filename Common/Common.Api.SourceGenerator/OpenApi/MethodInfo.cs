using Microsoft.CodeAnalysis;

namespace Zeta.Common.Api.SourceGenerator.OpenApi;

public record Parameter(string Type, string Name)
{
    public override string ToString() { return $"{Type} {Name}"; }
}

public record MethodInfo(string Name, string ReturnType, IEnumerable<Parameter> Parameters, ActionInfo ActionInfo);

public record ActionInfo(List<INamedTypeSymbol> NamedSymbols, AttributeData? SuccessAttributeData = null);