using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class Tenant : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    private List<Admin> _admins = new();
    public IReadOnlyCollection<Admin> Admins
    {
        get => _admins;
        set => _admins = (List<Admin>)value;
    }

    private List<Role> _roles = new();
    public IReadOnlyCollection<Role> Roles
    {
        get => _roles;
        set => _roles = (List<Role>)value;
    }

    private Tenant() { }

    public static Tenant From(Guid id, string name)
    {
        var instance = new Tenant
        {
            Id = id,
            Name = name
        };
        instance.Validate();
        
        return instance;
    }
    
    public void AddAdmin(Admin admin)
    {
        _admins.Add(admin);
    }
    
    public Role CreateRole(Guid id, string name, Color color)
    {
        var role = Role.Create(this, id, name, color);
        _roles.Add(role);

        return role;
    }
    
    public void RemoveRole(Role role)
    {
        _roles.Remove(role);
    }
}

public class TenantValidator : AbstractValidator<Tenant>
{
    public TenantValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty();
        RuleFor(x => x.Admins).NotNull();
    }
}

public class TenantConfiguration : IEntityTypeConfiguration<Tenant>
{
    public void Configure(EntityTypeBuilder<Tenant> builder)
    {
        builder.HasMany(x => x.Admins)
            .WithOne();

        builder.HasMany(x => x.Roles)
            .WithOne(x => x.Tenant)
            .HasForeignKey("TenantId");
    }
}