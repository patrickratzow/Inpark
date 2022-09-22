using Zeta.Common;
using Zeta.Inpark.Entities;

namespace Zeta.Inpark.Features.Speaks.Interfaces;

public interface ISpeaksMapper
{
    public Result<List<Speak>, string> Parse(string input);
}