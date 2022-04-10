using HtmlAgilityPack;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Services;

public interface IHtmlDocument
{
    List<Content> Parse();
}

public class HtmlDocument : IHtmlDocument
{
    private readonly HtmlAgilityPack.HtmlDocument _document;
    public HtmlDocument(HtmlAgilityPack.HtmlDocument document) { _document = document; }

    public List<Content> Parse()
    {
        var content = new List<Content>();

        foreach (var node in _document.DocumentNode.ChildNodes)
        {
            
        }
        
        return content;
    }
}

public interface IHtmlTransformer
{
    IHtmlDocument Load(string html);
}

public class HtmlTransformer : IHtmlTransformer
{
    public IHtmlDocument Load(string html)
    {
        var document = new HtmlAgilityPack.HtmlDocument();
        document.LoadHtml(html);

        return new HtmlDocument(document);
    }
}