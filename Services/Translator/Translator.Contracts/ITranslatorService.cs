namespace Zeta.Inpark.Translator.Contracts;

public interface ITranslatorService
{
    public ValueTask<T> Translate<T>(string to, T input, ICollection<string> properties);
}