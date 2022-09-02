using HtmlAgilityPack;

namespace Zeta.Inpark.Common.SDUI.Transformers;

public class HtmlTransformerService : ITransformerService
{
    public SDUINode Transform(string input)
    {
        var column = new SDUINode("Column");
        var document = CreateHtmlDocument(input);

        return column;
    }

    private static HtmlDocument CreateHtmlDocument(string input)
    {
        var document = new HtmlDocument();
        document.LoadHtml(input);
        
        return document;
    }
}