using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public class RefreshToken : Entity
{
    public Guid Id { get; private set; }
    public DateTime ExpiresAt { get; private set; }
    
    private RefreshToken()
    {
    }

    public static RefreshToken From(DateTime expiresAt)
    {
        var instance = new RefreshToken
        {
            Id = Guid.NewGuid(),
            ExpiresAt = expiresAt,
        };
        instance.Validate();

        return instance;
    }

    public bool IsExpired() => ExpiresAt < DateTime.Now;
}

public class RefreshTokenValidator : AbstractValidator<RefreshToken>
{
    public RefreshTokenValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.ExpiresAt).NotEmpty();
    }
}

public class RefreshTokenConfiguration : IEntityTypeConfiguration<RefreshToken>
{
    public void Configure(EntityTypeBuilder<RefreshToken> builder)
    {
    }
}