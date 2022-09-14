using Zoo.Common;

namespace Zeta.Inpark.Tenants.Errors;

public record TenantNotFound(Guid Id) : INotFoundError
{
    public string? ErrorMessage => $"No tenant was found with the Id: {Id}";
}