using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.Entities;

public class Menu : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; }
    public bool CanBeShared { get; private set; }
    private List<Shop> _shops = new();
    public IReadOnlyCollection<Shop> Shops
    {
        get => _shops;
        private set => _shops = value.ToList();
    }
    private List<MenuCategory> _categories = new();
    public IReadOnlyCollection<MenuCategory> Categories
    {
        get => _categories;
        private set => _categories = value.ToList();
    }
    
    private Menu() { }
    
    public static Menu Create(Guid id, string name, bool canBeShared)
    {
        var instance = new Menu
        {
            Id = id,
            Name = name,
            CanBeShared = canBeShared
        };
        instance.Validate();

        return instance;
    }
}

public class MenuValidator : AbstractValidator<Menu>
{
    public MenuValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.CanBeShared).NotNull();
        RuleFor(x => x.Shops).NotNull();
        RuleFor(x => x.Categories).NotNull();
    }
}

public class MenuConfiguration : IEntityTypeConfiguration<Menu>
{
    public void Configure(EntityTypeBuilder<Menu> builder)
    {
        builder.ToTable("Menus");
        
        builder.Property(x => x.Name).HasMaxLength(255);
        builder.Property(x => x.CanBeShared);

        builder.HasMany(x => x.Shops)
            .WithMany(x => x.Menus);
        builder.HasMany(x => x.Categories)
            .WithOne();
    }
}