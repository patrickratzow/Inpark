using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class Admin : Entity
{
    public Guid Id { get; private set; }
    public EmailAddress EmailAddress { get; private set; } = null!;
    public Password Password { get; private set; } = null!;
    public DateTime LastSeen { get; private set; }
    
    private List<RefreshToken> _refreshTokens = new();
    public IReadOnlyCollection<RefreshToken> RefreshTokens
    {
        get => _refreshTokens;
        private set => _refreshTokens = (List<RefreshToken>)value;
    }
    private List<Role> _roles = new();
    public IReadOnlyCollection<Role> Roles
    {
        get => _roles;
        private set => _roles = (List<Role>)value;
    }
    private List<Permission> _permissions = new();
    public IReadOnlyCollection<Permission> Permissions
    {
        get => _permissions;
        private set => _permissions = (List<Permission>)value;
    }

    private Admin() { }

    public static Admin Create(Guid id, EmailAddress emailAddress, Password password)
    {
        var instance = new Admin
        {
            Id = id,
            EmailAddress = emailAddress,
            Password = password,
            LastSeen = DateTime.Now,
        };
        instance.Validate();

        return instance;
    }

    public RefreshToken CreateRefreshToken()
    {
        var expiresAt = DateTime.Now.AddDays(30);
        var refreshToken = RefreshToken.Create(expiresAt);
        
        _refreshTokens.Add(refreshToken);
        
        return refreshToken;
    }
    
    public void RemoveRefreshToken(RefreshToken refreshToken)
    {
        _refreshTokens.Remove(refreshToken);
    }

    public void AddRole(Role role)
    {
        var alreadyHasRole = _roles.Any(r => r.Id == role.Id);
        if (alreadyHasRole) return;
        
        _roles.Add(role);
    }
    
    public void RemoveRole(Role role)
    {
        _roles.Remove(role);
    }
    
    public void AddPermission(Permission permission)
    {
        var alreadyHasPermission = _permissions.Any(r => r.Id == permission.Id);
        if (alreadyHasPermission) return;
        
        _permissions.Add(permission);
    }
    
    public void RemovePermission(Permission permission)
    {
        _permissions.Remove(permission);
    }
}

public class AdminValidator : AbstractValidator<Admin>
{
    public AdminValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.EmailAddress).NotNull();
        RuleFor(x => x.Password).NotNull();
        RuleFor(x => x.LastSeen).NotEmpty()
            .LessThanOrEqualTo(x => DateTime.Now);
        RuleFor(x => x.RefreshTokens).NotNull();
        RuleFor(x => x.Roles).NotNull();
        RuleFor(x => x.Permissions).NotNull();
    }
}

public class AdminConfiguration : IEntityTypeConfiguration<Admin>
{
    public void Configure(EntityTypeBuilder<Admin> builder)
    {
        builder.HasMany(x => x.RefreshTokens)
            .WithOne();

        builder.HasMany(x => x.Permissions)
            .WithMany(x => x.Admins);
        
        builder.OwnsOne(x => x.Password, x =>
        {
            x.Property(y => y.Hash).HasColumnName("Password_Hash");
            x.Property(y => y.Salt).HasColumnName("Password_Salt");
        });
        builder.OwnsOne(x => x.EmailAddress, x =>
        {
            x.Property(y => y.Value).HasColumnName("Email");
        });
    }
}