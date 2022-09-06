using System.Text.Json;

namespace Zeta.UI.Intermediate;

public interface IParser
{
    ValueTask<bool> ShouldParse(JsonElement json);
    ValueTask<IntermediateNode> Parse(JsonElement json);
}