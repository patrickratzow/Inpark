using System.Text.Json;

namespace Zeta.UI;

public record ParsingNode(
    string Type,
    JsonElement Value
);
