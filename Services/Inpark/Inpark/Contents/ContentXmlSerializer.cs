using System.Text;

namespace Zoo.Inpark.Contents;

public class ContentXmlSerializer
{
    public static string Serialize(ContentElement element, ContentXmlSerializerOptions? options = null)
    {
        var builder = new ContentXmlSerializerBuilder();
        builder.WriteElement(element);
        
        return builder.ToString();
    }
}

public class ContentXmlSerializerBuilder
{
    private readonly StringBuilder _builder = new();
    private int _indentation;
    
    public void WriteElement(ContentElement element)
    {
        WriteIndent();
        _builder.Append($"<{element.Name}");
        if (element.Attributes.Any())
        {
            foreach (var (key, value) in element.Attributes)
            {
                _builder.Append(' ');
                _builder.Append($"{key}=\"{value}\"");
            }
        }
        _builder.Append('>');

        if (element.Children.Any())
        {
            _builder.Append('\n');

            using (var indent = Indent())
            {
                foreach (var contentElement in element.Children)
                {
                    WriteElement(contentElement);
                }
            }

            _builder.Append('\n');
            WriteIndent();
        }
        else if (element.InnerText is not null)
        {
            _builder.Append(element.InnerText);
        }

        _builder.Append($"</{element.Name}>");
    }

    private void WriteIndent()
    {
        if (_indentation == 0) return;

        _builder.Append(new string(' ', _indentation * 2));
    }

    private Indentation Indent()
    {
        _indentation++;
        var indentation = new Indentation(() => _indentation--);

        return indentation;
    }

    public override string ToString() => _builder.ToString();
}

public class Indentation : IDisposable
{
    private readonly Action _onDispose;

    public Indentation(Action onDispose) { _onDispose = onDispose; }

    public void Dispose()
    {
        _onDispose();
    }
}

public record ContentXmlSerializerOptions(
);