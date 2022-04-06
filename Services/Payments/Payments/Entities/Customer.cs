using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Payments.Common;
using Zoo.Payments.ValueObjects;

namespace Zoo.Payments.Entities;

public class Customer : Entity
{
    private Customer() {}

    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public EmailAddress Email { get; private set; } = null!;

    public static Customer Create(Guid id, string name, EmailAddress emailAddress)
    {
        var instance = new Customer
        {
            Id = id,
            Name = name,
            Email = emailAddress,
            CreatedAt = DateTimeOffset.UtcNow,
            UpdatedAt = DateTimeOffset.UtcNow
        };
        instance.Validate();

        return instance;
    }
}

public class CustomerValidator : AbstractValidator<Customer>
{
    public CustomerValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
        RuleFor(x => x.Email).NotNull();
    }
}

public class CustomerEntityConfiguration : IEntityTypeConfiguration<Customer>
{
    public void Configure(EntityTypeBuilder<Customer> builder)
    {
        builder.Property(x => x.Name)
            .HasMaxLength(2048);
        
        builder.Primitive(x => x.Email, p => p.Email, prop =>
        {
            prop.HasMaxLength(2048);
        }, nav =>
        {
            nav.HasIndex(x => x.Email);
        });
    }
}