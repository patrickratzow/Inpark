using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Inpark.Common;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Entities;

public class Animal : Entity
{
    private Animal()
    {
    }

    public Guid Id { get; private set; }
    public AnimalName Name { get; private set; } = null!;
    
    public static Animal Create(Guid id, AnimalName name)
    {
        var instance = new Animal
        {
            Id = id,
            Name = name
        };
        instance.Validate();

        return instance;
    }
}

public class AnimalValidator : AbstractValidator<Animal>
{
    public AnimalValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotNull();
    }
}

public class AnimalConfiguration : IEntityTypeConfiguration<Animal>
{
    public void Configure(EntityTypeBuilder<Animal> builder)
    {
        builder.OwnsOne(x => x.Name);
    }
} 