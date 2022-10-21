using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;
using Success = OneOf.Types.Success;

namespace Zeta.Inpark.Food.Entities;

public class MenuCategory : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; }
    private List<MenuItem> _items = new();
    public IReadOnlyCollection<MenuItem> Items
    {
        get => _items;
        private set => _items = value.ToList();
    }

    private MenuCategory()
    {
    }

    public static MenuCategory Create(Guid id, string name)
    {
        var instance = new MenuCategory
        {
            Id = id,
            Name = name
        };
        instance.Validate();
        
        return instance;
    }
    public Result<string> AddFood(MenuItem menuItem)
    {
        var existingFood = _items.Find(x => x.Id == menuItem.Id);
        if (existingFood is not null) return "Food is already in the category";
        
        _items.Add(menuItem);

        return new Success();
    }
}

public class MenuCategoryValidator : AbstractValidator<MenuCategory>
{
    public MenuCategoryValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.Items).NotNull();
    }
}

public class MenuCategoryConfiguration : IEntityTypeConfiguration<MenuCategory>
{
    public void Configure(EntityTypeBuilder<MenuCategory> builder)
    {
        builder.ToTable("Categories", b => b.IsTemporal());

        builder.Property(x => x.Name).HasMaxLength(255);
        
        builder.HasMany(x => x.Items)
            .WithOne();
    }
}