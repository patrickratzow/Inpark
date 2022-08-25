using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Common;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Entities;

public class ParkEvent : Entity
{
    public Guid Id { get; private set; }
    public ImagePair Image { get; private set; } = null!;
    public string Title { get; private set; } = null!;
    public TimeRange Range { get; private set; } = null!;
    public string Content { get; private set; } = null!;

    private ParkEvent()
    {

    }
    public static ParkEvent Create(Guid id, ImagePair image, string title, TimeRange range, string content)
    {
        var instance = new ParkEvent
        {
            Id = id,
            Image = image,
            Title = title,
            Range = range,
            Content = content,
        };
        instance.Validate();

        return instance;
    }
}

public class ParkEventValidator : AbstractValidator<ParkEvent>
{
    public ParkEventValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Image).NotNull();
        RuleFor(x => x.Title).NotEmpty();
        RuleFor(x => x.Range).NotNull();
        RuleFor(x => x.Content).NotEmpty();
    }
}


public class ParkEventConfiguration : IEntityTypeConfiguration<ParkEvent>
{
    public void Configure(EntityTypeBuilder<ParkEvent> builder)
    {
        builder.OwnsOne(x => x.Image);
        builder.Property(x => x.Content).HasColumnType("nvarchar(max)");

        builder.OwnsOne(x => x.Range, b =>
        {
            b.HasIndex(x => new
            {
                x.Start,
                x.End
            });
            b.Property(x => x.Start).HasColumnName("TimeRange_Start");
            b.Property(x => x.End).HasColumnName("TimeRange_End");
        });
    }
}
