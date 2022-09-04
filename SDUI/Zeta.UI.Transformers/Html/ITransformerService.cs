namespace Zeta.UI.Transformers.Html;

public interface ITransformerService
{
    ValueTask<SDUINode> Transform(string input);
}