using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class FacebookProvider : Provider
{
    public string? DisplayName { get; private set; }
    public EmailAddress? Email { get; private set; }
    public string? PhotoUrl { get; private set; }
    public string? PhoneNumber { get; private set; }
    
    private FacebookProvider() {}
    
    public static FacebookProvider From(string providerId, 
        string? displayName, EmailAddress? email, string? photoUrl, string? phoneNumber)
    {
        var instance = new FacebookProvider
        {
            Id = providerId,
            DisplayName = displayName,
            Email = email,
            PhotoUrl = photoUrl,
            PhoneNumber = phoneNumber
        };
        instance.Validate();
        
        return instance;
    }
}

public class FacebookProviderConfiguration : IEntityTypeConfiguration<FacebookProvider>
{
    public void Configure(EntityTypeBuilder<FacebookProvider> builder)
    {
        builder.ToTable("FacebookProviders");

        builder.Property(x => x.DisplayName).HasMaxLength(255);
        builder.OwnsOne(x => x.Email, b =>
        {
            b.Property(x => x.Value).HasMaxLength(512);
        });
        builder.Property(x => x.PhotoUrl).HasMaxLength(512);
        builder.Property(x => x.PhoneNumber).HasMaxLength(16);
    }
}