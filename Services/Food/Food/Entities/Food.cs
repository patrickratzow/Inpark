using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Food.Common;
using Zeta.Inpark.Food.ValueObjects;

namespace Zeta.Inpark.Food.Entities;

public class Food : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public Price Price { get; private set; }
    public Category? Category { get; private set; }

    private Food()
    {
    }

    public static Food Create(Guid id, string name, Price price, Category? category)
    {
        var instance = new Food
        {
            Id = id,
            Name = name,
            Price = price,
            Category = category
        };
        instance.Validate();

        return instance;
    }
}

public class FoodValidator : AbstractValidator<Food>
{
    public FoodValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty();
        RuleFor(x => x.Price).NotNull();
    }
}

public class FoodConfiguration : IEntityTypeConfiguration<Food>
{
    public void Configure(EntityTypeBuilder<Food> builder)
    {
        builder.ToTable("Foods", b => b.IsTemporal());
        builder.HasOne(x => x.Category)
            .WithMany(x => x.Foods)
            .HasForeignKey();
        
        builder.Property(x => x.Name).HasMaxLength(255);
        builder.OwnsOne(x => x.Price, b =>
        {
            b.Property(x => x.Value).HasColumnName("Price");
        });
    }
}