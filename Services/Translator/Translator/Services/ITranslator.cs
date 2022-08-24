namespace Zeta.Inpark.Translator.Services;

public interface ITranslator
{
    Task<string> TranslateText(string to, string input);
}