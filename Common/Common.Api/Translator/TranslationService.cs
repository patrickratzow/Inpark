using Zeta.Inpark.Translator.Contracts;

namespace Zeta.Common.Api.Translator;

public class TranslationService : ITranslationService
{
    public string? CurrentTranslation { get; set; }

    private readonly ITranslatorService _translatorService;

    public TranslationService(ITranslatorService translatorService)
    {
        _translatorService = translatorService;
    }

    public async ValueTask<string> Translate(string text)
    {
        if (CurrentTranslation is null) return text;

        var result = await _translatorService.Translate(CurrentTranslation, text);

        return result;
    }
}