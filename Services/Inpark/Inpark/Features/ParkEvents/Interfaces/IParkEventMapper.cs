using Zeta.Inpark.Common.SDUI;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Features.ParkEvents.Interfaces;

public interface IParkEventMapper
{
    Result<List<ParkEvent>, string> ParseParkEvent(string input);
    Result<SDUINode, string> ParseContent(string content);
}

