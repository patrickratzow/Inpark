using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public class Permission : Entity
{
    public string Id { get; private set; }
    private List<Role> _roles = new();
    public IReadOnlyList<Role> Roles
    {
        get => _roles;
        private set => _roles = new(value);
    }
    private List<Admin> _admins = new();
    public IReadOnlyCollection<Admin> Admins
    {
        get => _admins;
        private set => _admins = (List<Admin>)value;
    }

    private Permission() {}
    
    public static Permission Create(string id)
    {
        return new Permission
        {
            Id = id
        };
    }
}

public class PermissionValidator : AbstractValidator<Permission>
{
    public PermissionValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Roles).NotNull();
        RuleFor(x => x.Admins).NotNull();
    }
}

public class PermissionConfiguration : IEntityTypeConfiguration<Permission>
{
    public void Configure(EntityTypeBuilder<Permission> builder)
    {
        builder.Property<Guid>("TenantId");
        builder.HasKey("TenantId", "Id");
    }
}