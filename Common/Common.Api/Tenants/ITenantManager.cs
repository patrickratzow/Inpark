namespace Zoo.Common.Api;

public interface ITenantManager
{
    Tenant Tenant { get; set; }
    ValueTask<Tenant?> GetTenant(Guid tenantId);
}