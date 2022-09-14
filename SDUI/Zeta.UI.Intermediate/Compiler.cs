using System.Text.Json;
using Microsoft.Extensions.Logging;
using Zeta.UI.Intermediate.Nodes;

namespace Zeta.UI.Intermediate;

public class Compiler : ICompiler
{
    private static readonly IReadOnlyList<Type> Parsers = typeof(Parser)
        .Assembly
        .GetExportedTypes()
        .Where(t => t.IsClass && !t.IsAbstract && t.IsSubclassOf(typeof(Parser)))
        .ToList();
    
    private readonly ILogger<Compiler> _logger;
    
    public Compiler(ILogger<Compiler> logger)
    {
        _logger = logger;
    }

    public ValueTask<IntermediateNode> Compile(JsonDocument json)
    {
        var element = json.RootElement;
        IntermediateNode root = new RootNode();

        foreach (var obj in element.EnumerateArray())
        {
            var content = obj.GetProperty("content");
            var section = new SectionNode();
            root.AddChild(section);
            
            ParseElement(content, section);
        }
        
        return new(root);
    }
    
    private void ParseElement(JsonElement json, IntermediateNode parent)
    {
        if (json.ValueKind == JsonValueKind.Array)
        {
            ParseArray(json, parent);

            return;
        }
        
        var parser = GetParser(json);
        if (parser is null)
        {
            _logger.LogWarning("Unable to find a parser for {JsonElement}", json);

            return;
        }
        
        var node = parser.Parse();
        // Add this to the parent
        parent.AddChild(node);
    }

    private void ParseArray(JsonElement json, IntermediateNode parent)
    {
        foreach (var element in json.EnumerateArray())
        {
            if (element.ValueKind is JsonValueKind.Array)
            {
                ParseArray(element, parent);

                continue;
            }
            
            var parser = GetParser(element);
            if (parser is null)
            {
                _logger.LogWarning("Unable to find a parser for {JsonElement}", element);

                continue;
            }

            ParseElement(element, parent);
        }
    }

    private static Parser? GetParser(JsonElement json)
    {
        return Parsers
            .Select(parserType => (Parser)Activator.CreateInstance(parserType, json)!)
            .Select(parser => new
            {
                parser,
                shouldParse = parser.ShouldParse()
            })
            .Where(t => t.shouldParse)
            .Select(t => t.parser)
            .FirstOrDefault();
    }
}