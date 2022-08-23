namespace Zeta.Inpark.Translator.Services;

public interface ITranslator
{
    Task<string> Translate(string to, string input);
}