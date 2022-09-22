using System.Reflection;
using Zeta.UI.Intermediate;

namespace Zeta.UI.Mappers;

public interface IMapper
{
    ValueTask<SDUINode> Map<T>(T intermediateNode) where T : IntermediateNode;
}

public class Mapper : IMapper
{
    private readonly IServiceProvider _serviceProvider;
    private readonly List<Type> _visitors;
    private readonly List<Type> _transformers;

    public Mapper(IUseCaseOptions options, IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
        _visitors = options.Visitors.ToList();
        _transformers = options.Transformers.ToList();
    }

    public async ValueTask<SDUINode> Map<T>(T intermediateNode) where T : IntermediateNode
    {
        var transformer = await GetTransformer(intermediateNode);
        var node = await transformer.Transform(intermediateNode);
        
        var childrenMaps = intermediateNode.Children.Select(async child =>
        {
            var method = GetType().GetMethod(nameof(Map), BindingFlags.Public | BindingFlags.Instance)!;
            var genericMethod = method.MakeGenericMethod(child.GetType());
            var childNode = await (ValueTask<SDUINode>)genericMethod.Invoke(this, new object[] { child })!;
            childNode.SetParent(node);

            return childNode;
        });
        await Task.WhenAll(childrenMaps);

        var visitors = await GetVisitors(node, intermediateNode);
        foreach (var visitor in visitors)
        {
            visitor.Visit(node, intermediateNode);
        }
        
        return node;
    }
    
    private ValueTask<List<IVisitor<T>>> GetVisitors<T>(SDUINode node, T intermediateNode) where T : IntermediateNode
    {
        var visitors = _visitors
            .Select(x =>
            {
                var genericType = typeof(IVisitor<>).MakeGenericType(typeof(T));
                var service = _serviceProvider.GetService(genericType);

                return service;
            })
            .Where(x => x is not null)
            .Cast<IVisitor<T>>();

        return new(
            visitors.Select(visitor => new
            {
                visitor,
                shouldVisit = visitor.ShouldVisit(node, intermediateNode)
            })
            .Where(t => t.shouldVisit)
            .Select(t => t.visitor)
            .ToList()
        );
    }

    private async ValueTask<ITransformer<T>> GetTransformer<T>(T intermediateNode) where T : IntermediateNode
    {
        var transformers = _transformers
            .Select(x =>
            {
                var genericType = typeof(ITransformer<>).MakeGenericType(typeof(T));
                var service = _serviceProvider.GetService(genericType);

                return service;
            })
            .Where(x => x is not null)
            .Cast<ITransformer<T>>();
        
        foreach (var transformer in transformers)
        {
            var shouldTransform = await transformer.ShouldTransform(intermediateNode);
            if (!shouldTransform) continue;

            return transformer;
        }
        
        throw new InvalidOperationException($"No transformer found for {intermediateNode}");
    }
}