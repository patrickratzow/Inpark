using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public class Tenant : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    private List<User> _users = new();
    public IReadOnlyCollection<User> Users
    {
        get => _users;
        set => _users = (List<User>)value;
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
    
    public void AddUser(User user)
    {
        _users.Add(user);
    }
}

public class TenantValidator : AbstractValidator<Tenant>
{
    public TenantValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty();
        RuleFor(x => x.Users).NotNull();
    }
}

public class TenantConfiguration : IEntityTypeConfiguration<Tenant>
{
    public void Configure(EntityTypeBuilder<Tenant> builder)
    {
        builder.HasMany(x => x.Users)
            .WithOne();
    }
}