using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public class User : Entity
{
    public Guid Id { get; private set; }
    public string UserId { get; private set; }
    public string DisplayName { get; private set; }
    public Provider Provider { get; private set; }

    private User()
    {
    }

    public static User Create(Guid id, string userId, string displayName, Provider provider)
    {
        var instance = new User
        {
            Id = id,
            UserId = userId,
            DisplayName = displayName,
            Provider = provider
        };

        instance.Validate();

        return instance;
    }

    public class UserValidator : AbstractValidator<User>
    {
        public UserValidator()
        {
            RuleFor(u => u.Id).NotEmpty();
            RuleFor(u => u.UserId).NotEmpty();
            RuleFor(u => u.DisplayName).NotEmpty();
            RuleFor(u => u.Provider).NotNull();
        }
    }

    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasKey(u => u.Id);

            builder.HasOne(u => u.Provider)
                .WithOne()
                .HasForeignKey<Provider>("UserId");
        }
    }
}