using System.Text.Json;

namespace Zeta.UI.Intermediate;

public interface IParser
{
    bool ShouldParse(JsonElement json);
    IntermediateNode Parse(JsonElement json);
}