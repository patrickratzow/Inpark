using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Entities;

public class MenuItem : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public Price Price { get; private set; }

    private MenuItem()
    {
    }

    public static MenuItem Create(Guid id, string name, Price price)
    {
        var instance = new MenuItem
        {
            Id = id,
            Name = name,
            Price = price,
        };
        instance.Validate();

        return instance;
    }
}

public class MenuItemValidator : AbstractValidator<MenuItem>
{
    public MenuItemValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.Price).NotNull();
    }
}

public class MenuItemConfiguration : IEntityTypeConfiguration<MenuItem>
{
    public void Configure(EntityTypeBuilder<MenuItem> builder)
    {
        builder.ToTable("Items", b => b.IsTemporal());
        
        builder.Property(x => x.Name).HasMaxLength(255);

        builder.Property(x => x.Price)
            .HasConversion(
                price =>  price.Value,
                value => Price.From(value)
            );
    }
}