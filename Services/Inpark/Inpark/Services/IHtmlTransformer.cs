using HtmlAgilityPack;
using Zeta.Inpark.Common.SDUI;
using Zeta.Inpark.Models;

namespace Zeta.Inpark.Services;

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
            else if (childNode is { Name: "li" })
            {
                var children = ParseChildren(childNode);
                var parent = new Content(string.Empty, ContentType.ListItem)
                {
                    Children = children
                };

                contents.Add(parent);
            }
            else if (childNode is { Name: "strong" })
            {
                var children = ParseChildren(childNode);
                var parent = new Content(string.Empty, ContentType.Strong)
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
    SDUINode ParseToSDUI(string html);
}

public class HtmlTransformer : IHtmlTransformer
{
    public IHtmlDocument Load(string html)
    {
        var document = new HtmlAgilityPack.HtmlDocument();
        document.LoadHtml(html);

        return new HtmlDocument(document);
    }

    public SDUINode ParseToSDUI(string html)
    {
        var wrapper = new SDUINode("Column");
        var document = new HtmlAgilityPack.HtmlDocument();
        document.LoadHtml(html);

        ParseChildren(document.DocumentNode, wrapper);
        
        return wrapper;
    }

    private void ParseChildren(HtmlNode htmlNode, SDUINode parent)
    {
        foreach (var child in htmlNode.ChildNodes)
        {
            if (child is { Name: "br" } or { InnerText: "\n" })
            {
                var node = new TextSpan();
                node.SetParent(parent);
                node.SetText("\n\n", false);
            }
            else if (child is { Name: "p" })
            {
                var node = new SDUINode("RichText");
                node.SetParent(parent);
                
                var textSpan = new TextSpan();
                textSpan.SetParent(node);
                
                ParseChildren(child, textSpan);
            }
            else if (child is { Name: "strong" or "b" })
            {
                var node = new TextSpan();
                node.SetParent(parent);
                node.SetTextWeight(TextWeight.Bold);
                node.SetText(child.InnerText);
            }
            else if (child is { Name: "em" or "i" })
            {
                var node = new TextSpan();
                node.SetParent(parent);
                node.SetFontStyle(FontStyle.Italic);
                node.SetText(child.InnerText);
            }
            else if (child is HtmlTextNode textNode)
            {
                var node = new TextSpan();
                node.SetParent(parent);
                node.SetFontStyle(FontStyle.Normal);
                node.SetText(textNode.InnerText);
            }
        }
    }
}