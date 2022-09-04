using System.Reflection;
using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html;

public class VisitorService
{
    private static readonly List<IVisitor> Visitors = Assembly.GetExecutingAssembly()
        .GetTypes()
        .Where(t => t.IsClass && !t.IsAbstract && t.IsAssignableTo(typeof(IVisitor)))
        .Select(Activator.CreateInstance)
        .Cast<IVisitor>()
        .ToList();
    
    private readonly HashSet<SDUINode> _hasVisited = new();
    
    public void Visit(SDUINode node, HtmlNode htmlNode)
    {
        if (_hasVisited.Contains(node)) return;

        var visitors = FindValidators(node);
        foreach (var visitor in visitors)
        {
            CallVisitor(visitor, node, htmlNode);
        }
        
        _hasVisited.Add(node);
    }

    private static List<IVisitor> FindValidators(SDUINode node)
    {
        var type = node.GetType();
        
        return Visitors
            .Where(v => v.GetType().GetInterfaces()
                .Any(i => i.GenericTypeArguments
                    .Any(t => type.IsAssignableTo(t) || type.IsSubclassOf(t))
                )
            )
            .ToList();
    }

    private static void CallVisitor(IVisitor visitor, SDUINode node, HtmlNode htmlNode)
    {
        var method = visitor.GetType().GetMethod("Visit");
        
        method!.Invoke(visitor, new object[] {node, htmlNode});
    }
}