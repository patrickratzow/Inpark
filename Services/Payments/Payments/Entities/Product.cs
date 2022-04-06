using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Payments.Common;

namespace Zoo.Payments.Entities;

public class Product : Entity
{
    private Product() {}

    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;

    public static Product Create(Guid id, string name)
    {
        var instance = new Product
        {
            Id = id,
            Name = name
        };
        instance.Validate();

        return instance;
    }
}

public class ProductValidator : AbstractValidator<Product>
{
    public ProductValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(4096);
    }
}

public class ProductEntityConfiguration : IEntityTypeConfiguration<Product>
{
    public void Configure(EntityTypeBuilder<Product> builder)
    {
        builder.Property(x => x.Name)
            .HasMaxLength(4096);
    }
}