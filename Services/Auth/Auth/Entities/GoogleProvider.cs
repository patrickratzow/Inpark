using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class GoogleProvider : Provider
{
    public string? DisplayName { get; private set; }
    public EmailAddress? Email { get; private set; }
    public string? PhotoUrl { get; private set; }
    public string? PhoneNumber { get; private set; }

    private GoogleProvider() {}

    public static GoogleProvider From(string providerId, 
        string? displayName, EmailAddress? email, string? photoUrl, string? phoneNumber)
    {
        var instance = new GoogleProvider
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

public class GoogleProviderConfiguration : IEntityTypeConfiguration<GoogleProvider>
{
    public void Configure(EntityTypeBuilder<GoogleProvider> builder)
    {
        builder.ToTable("GoogleProviders");

        builder.Property(x => x.DisplayName).HasMaxLength(255);
        builder.OwnsOne(x => x.Email, b =>
        {
            b.Property(x => x.Value).HasMaxLength(512);
        });
        builder.Property(x => x.PhotoUrl).HasMaxLength(512);
        builder.Property(x => x.PhoneNumber).HasMaxLength(16);
    }
}