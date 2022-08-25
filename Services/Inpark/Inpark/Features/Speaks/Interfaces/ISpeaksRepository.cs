using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.Speaks.Interfaces;

public interface ISpeaksRepository
{
    ValueTask<Result<string, string>> GetRange(TimeRange range);
}