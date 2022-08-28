using System.Text;

namespace Zeta.Inpark.Common.SDUI;

// ReSharper disable once InconsistentNaming
public class SDUINodeSerializer
{
    private readonly StringBuilder _builder;
    private int _indent;

    private SDUINodeSerializer(StringBuilder builder)
    {
        _builder = builder;
        _indent = default;
    }
    
    private void Add(SDUINode node)
    {
        _builder.Append(Indentation);
        _builder.Append('<');
        _builder.Append(node.Name);
        foreach (var (key, value) in node.Attributes)
        {
            _builder.Append(' ');
            _builder.Append(key);
            _builder.Append('=');
            _builder.Append('"');
            _builder.Append(value);
            _builder.Append('"');
        }
        _builder.Append('>');
        if (node.InnerText is not null)
        {
            _builder.Append(node.InnerText);
        }
        if (node.Children.Any())
        {
            //_builder.Append('\n');
           // _indent++;
            foreach (var child in node.Children)
            {
                Add(child);
            }
            //_indent--;
            //_builder.Append('\n');
            _builder.Append(Indentation);
        }
        _builder.Append($"</{node.Name}>");
    }
    
    private string Indentation => new string(' ', _indent * 2);

    public override string ToString() => _builder.ToString();

    public static string Serialize(SDUINode node)
    {
        var serializer = new SDUINodeSerializer(new());
        serializer.Add(node);

        return serializer.ToString();
    }
}
