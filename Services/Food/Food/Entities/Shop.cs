using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.Entities;

public class Shop : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public string Description { get; private set; } = null!;
    private List<Menu> _menus = new();
    public IReadOnlyCollection<Menu> Menus
    {
        get => _menus;
        private set => _menus = value.ToList();
    }

    private Shop() { }
    
    public static Shop Create(Guid id, string name, string description)
    {
        var instance = new Shop
        {
            Id = id,
            Name = name,
            Description = description
        };
        instance.Validate();

        return instance;
    }
}

public class ShopValidator : AbstractValidator<Shop>
{
    public ShopValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.Description).NotEmpty().MaximumLength(4096);
        RuleFor(x => x.Menus).NotNull();
    }
}

public class ShopConfiguration : IEntityTypeConfiguration<Shop>
{
    public void Configure(EntityTypeBuilder<Shop> builder)
    {
        builder.ToTable("Shops");
        
        builder.Property(x => x.Name).HasMaxLength(255);
        builder.Property(x => x.Description).HasMaxLength(4096);

        builder.HasMany(x => x.Menus)
            .WithMany(x => x.Shops);
    }
}