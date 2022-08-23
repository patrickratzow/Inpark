namespace Zeta.Inpark.Translator.Models;

public class AzureTranslatorOptions
{
    public const string Position = nameof(AzureTranslatorOptions);

    public string Region { get; set; } = string.Empty;
    public string ResourceKey { get; set; } = string.Empty;
    public string Endpoint { get; set; } = string.Empty;
}