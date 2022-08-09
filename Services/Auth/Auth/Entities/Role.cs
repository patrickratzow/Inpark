using System.Globalization;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class Role : Entity
{
    public Guid Id { get; private set; }
    public Tenant Tenant { get; private set; } = null!;
    public string Name { get; private set; } = null!;
    public Color Color { get; private set; } = null!;
    private List<Permission> _permissions = new();
    public IReadOnlyList<Permission> Permissions
    {
        get => _permissions;
        private set => _permissions = new(value);
    }
    
    private Role() {}

    public static Role Create(Tenant tenant, Guid id, string name, Color color)
    {
        var instance = new Role
        {
            Tenant = tenant,
            Id = id,
            Name = name,
            Color = color,
            Permissions = new List<Permission>()
        };
        instance.Validate();

        return instance;
    }
}

public class RoleValidator : AbstractValidator<Role>
{
    public RoleValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty();
        RuleFor(x => x.Color).NotNull();
        RuleFor(x => x.Permissions).NotNull();
    }
}

public class RoleConfiguration : IEntityTypeConfiguration<Role>
{
    public void Configure(EntityTypeBuilder<Role> builder)
    {
        builder.Property<Guid>("TenantId");
        builder.HasIndex("TenantId", "Name").IsUnique();

        builder.HasMany(x => x.Permissions)
            .WithMany(x => x.Roles);
        
        builder.OwnsOne(x => x.Color, b => b.Property(x => x.Value).HasColumnName("Color"));
    }
}