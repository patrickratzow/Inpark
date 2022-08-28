namespace Zeta.Inpark.Translator.Contracts;

public interface ITranslatorService
{
    public ValueTask<string> TranslateSdui(string to, string text);
    public ValueTask<T> Translate<T>(string to, T input, ICollection<string> properties);
}