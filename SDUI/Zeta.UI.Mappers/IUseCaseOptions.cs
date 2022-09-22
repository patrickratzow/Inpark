namespace Zeta.UI.Mappers;

public interface IUseCaseOptions
{
    IEnumerable<Type> Visitors { get; }
    IEnumerable<Type> Transformers { get; }
}

public class DefaultUseCaseOptions : IUseCaseOptions
{
    public IEnumerable<Type> Visitors => AppDomain.CurrentDomain
        .GetAssemblies()
        .SelectMany(x => x.GetExportedTypes())
        .Where(x => x.IsAssignableTo(typeof(IVisitor)) && x.IsClass && !x.IsAbstract);
    
    public IEnumerable<Type> Transformers => AppDomain.CurrentDomain
        .GetAssemblies()
        .SelectMany(x => x.GetExportedTypes())
        .Where(x => x.IsAssignableTo(typeof(ITransformer)) && x.IsClass && !x.IsAbstract);
}

