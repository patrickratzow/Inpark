using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Inpark.Common;
using Zoo.Inpark.ValueObjects;
using Error = OneOf.Types.Error;

namespace Zoo.Inpark.Entities;

public enum IUCNStatus
{
    Unknown, EX, EW, CR, EN, VU, NT, LC
}

public class Animal : Entity
{
    private Animal()
    {
    }

    public Guid Id { get; private set; }
    public AnimalName Name { get; private set; } = null!;
    public IUCNStatus Status { get; private set; }
    public ImagePair Image { get; private set; } = null!;
    public string Category { get; private set; } = null!;
    public string Content { get; private set; } = null!;

    public static Animal Create(Guid id, AnimalName name, ImagePair imagePair, 
        string category, string content)
    {
        var instance = new Animal
        {
            Id = id,
            Name = name,
            Status = IUCNStatus.Unknown,
            Image = imagePair,
            Category = category,
            Content = content
        };
        instance.Validate();

        return instance;
    }

    public Result<Error> Update(AnimalName name, ImagePair imagePair, string category, string content)
    {
        try
        {
            Name = name;
            Image = imagePair;
            Category = category;
            Content = content;
            
            Validate();
            return Result<Error>.Success;
        }
        catch (Exception)
        {
            return new Error();
        }
    }
}

public class AnimalValidator : AbstractValidator<Animal>
{
    public AnimalValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotNull();
        RuleFor(x => x.Status).IsInEnum();
        RuleFor(x => x.Image).NotNull();
        RuleFor(x => x.Category).NotEmpty();
        RuleFor(x => x.Content).NotEmpty();
    }
}

public class AnimalConfiguration : IEntityTypeConfiguration<Animal>
{
    public void Configure(EntityTypeBuilder<Animal> builder)
    {
        builder.OwnsOne(x => x.Name, 
            b =>
            {
                b.HasIndex(x => x.LatinName);
            });
        builder.OwnsOne(x => x.Image);
        builder.Property(x => x.Content).HasColumnType("nvarchar(max)");
    }
} 