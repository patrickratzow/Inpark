using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

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
    }
}