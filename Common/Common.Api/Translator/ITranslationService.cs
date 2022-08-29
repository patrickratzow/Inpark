namespace Zoo.Common.Api.Translator;

public interface ITranslationService
{
    string? CurrentTranslation { get; set; }
    
    ValueTask<string> Translate(string text);
}