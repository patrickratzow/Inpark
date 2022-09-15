using Zeta.Common;

namespace Zeta.Inpark.Tenants.Errors;

public record ServiceNotFound(string Id) : INotFoundError
{
    public string? ErrorMessage => $"No service was found with Id: {Id}";
}