namespace Zeta.Inpark.Translator.Contracts;

public interface ITranslatorService
{
    public ValueTask<string> Translate(string to, string text);
    public ValueTask<T> TranslateObject<T>(string to, T input, ICollection<string> properties);
}