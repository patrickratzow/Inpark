namespace Zeta.Common.Api;

public interface ITenantManager
{
    Tenant Tenant { get; set; }
    ValueTask<Tenant?> GetTenant(Guid tenantId);
}