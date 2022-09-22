namespace Zeta.Common.Api;

public class TenantManager : ITenantManager
{
    public Tenant Tenant { get; set; } = null!;
    public ValueTask<Tenant?> GetTenant(Guid tenantId)
    {
        return new(new Tenant(tenantId, AnimalProvider.Umbraco));
    }
}