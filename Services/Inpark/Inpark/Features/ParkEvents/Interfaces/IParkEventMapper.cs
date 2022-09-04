using Zeta.Inpark.Entities;
using Zeta.UI;

namespace Zeta.Inpark.Features.ParkEvents.Interfaces;

public interface IParkEventMapper
{
    Result<List<ParkEvent>, string> ParseParkEvent(string input);
    ValueTask<Result<SDUINode, string>> ParseContent(string content);
}

