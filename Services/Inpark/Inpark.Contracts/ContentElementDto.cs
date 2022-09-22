namespace Zeta.Inpark.Contracts;

public record ContentElementDto(
    string Name,
    Dictionary<string, string> Attributes,
    List<ContentElementDto> Children,
    string? InnerText = null
);