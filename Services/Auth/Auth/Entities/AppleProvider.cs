using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Entities;

public class AppleProvider : Provider
{
    public string? DisplayName { get; private set; }
    public EmailAddress? Email { get; private set; }
    public string? PhotoUrl { get; private set; }
    public string? PhoneNumber { get; private set; }
    
    private AppleProvider(){}

    public static AppleProvider From(string providerId,
        string? displayName, EmailAddress? email, string? photoUrl, string? phoneNumber)
    {
        var instance = new AppleProvider
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

public class AppleProviderConfiguration : IEntityTypeConfiguration<AppleProvider>
{
    public void Configure(EntityTypeBuilder<AppleProvider> builder)
    {
        builder.ToTable("AppleProviders");

        builder.Property(x => x.DisplayName).HasMaxLength(255);
        builder.OwnsOne(x => x.Email, b =>
        {
            b.Property(x => x.Value).HasMaxLength(512);
        });
        builder.Property(x => x.PhotoUrl).HasMaxLength(512);
        builder.Property(x => x.PhoneNumber).HasMaxLength(16);
    }
}