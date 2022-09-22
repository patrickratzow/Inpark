using System.Text.Json;

namespace Zeta.UI.Intermediate;

public interface ICompiler
{
    public ValueTask<IntermediateNode> Compile(JsonDocument json);
}