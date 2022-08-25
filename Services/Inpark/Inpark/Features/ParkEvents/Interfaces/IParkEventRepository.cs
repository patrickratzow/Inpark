namespace Zeta.Inpark.Features.ParkEvents.Interfaces;

public interface IParkEventRepository
{
    ValueTask<Result<string, string>> GetContent();
}

