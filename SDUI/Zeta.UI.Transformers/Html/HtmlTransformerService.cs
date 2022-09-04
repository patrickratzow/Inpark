using HtmlAgilityPack;

namespace Zeta.UI.Transformers.Html;

public class HtmlTransformerService : ITransformerService
{
    private readonly IEnumerable<ITransformer> _transformers;
    private readonly VisitorService _visitorService;

    public HtmlTransformerService(IEnumerable<ITransformer> transformers, VisitorService visitorService)
    {
        _transformers = transformers;
        _visitorService = visitorService;
    }

    public async ValueTask<SDUINode> Transform(string input)
    {
        var column = new SDUINode("Column");
        var document = CreateHtmlDocument(input);

        await TransformNode(document.DocumentNode, column);
        
        return column;
    }

    private async ValueTask TransformNode(HtmlNode htmlNode, SDUINode parent)
    {
        var transformer = _transformers
            .OrderBy(x => x.Priority)
            .FirstOrDefault(x => x.ShouldTransform(htmlNode));
        if (transformer is null) throw new($"No transformer found for node {htmlNode.Name}");

        var node = await transformer.Transform(htmlNode);
        node.SetParent(parent);
        
        foreach (var child in htmlNode.ChildNodes)
        {
            await TransformNode(child, node);
        }
        
        _visitorService.Visit(node, htmlNode);
    }

    private static HtmlDocument CreateHtmlDocument(string input)
    {
        var document = new HtmlDocument();
        document.LoadHtml(input);
        
        return document;
    }
}