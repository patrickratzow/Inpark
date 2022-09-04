namespace Zeta.UI.Mappers;

public interface IUseCaseOptions
{
    IEnumerable<IVisitor> Visitors { get; }
    IEnumerable<ITransformer> Transformers { get; }
}