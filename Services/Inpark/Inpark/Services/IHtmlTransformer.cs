using HtmlAgilityPack;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Services;

public interface IHtmlDocument
{
    IContent Parse();
}

public class HtmlDocument : IHtmlDocument
{
    private readonly HtmlAgilityPack.HtmlDocument _document;
    public HtmlDocument(HtmlAgilityPack.HtmlDocument document) { _document = document; }

    public IContent Parse()
    {
        var nodes = ParseChildren(_document.DocumentNode);

        return new ContentLayout(new())
        {
            Children = nodes
        };
    }

    private List<Content> ParseChildren(HtmlNode node)
    {
        var contents = new List<Content>();
        
        foreach (var childNode in node.ChildNodes)
        {
            if (childNode is { Name: "br" } or { InnerText: "\n" })
            {
                contents.Add(new ContentLayout(new(), LayoutType.Spacer));
            }
            else if (childNode is { Name: "p" })
            {
                var children = ParseChildren(childNode)
                    .Where(x => x.Value is not "\n")
                    .ToList();

                contents.AddRange(children);
            }
            else if (childNode is HtmlTextNode)
            {
                contents.Add(new(childNode.InnerText, ContentType.Text));
            }
            else if (childNode is { Name: "ul" })
            {
                var children = ParseChildren(childNode);
                var parent = new ContentLayout(new(), LayoutType.List)
                {
                    Children = children
                };

                contents.Add(parent);
            }
            else if (childNode is { Name:  "li" } )
            {
                var children = ParseChildren(childNode);
                var parent = new Content(string.Empty, ContentType.ListItem)
                {
                    Children = children
                };

                contents.Add(parent);
            }
        }
        
        return contents;
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