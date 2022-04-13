using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Inpark.Common;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Entities;

public class OpeningHour : Entity
{
    private OpeningHour() { }

    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public TimeRange Range { get; private set; } = null!;
    public bool Open { get; private set; }

    public static OpeningHour Create(Guid id, string name, TimeRange range, bool open)
    {
        var instance = new OpeningHour
        {
            Id = id,
            Name = name,
            Range = range,
            Open = open
        };
        instance.Validate();

        return instance;
    }
}

public class OpeningHourValidator : AbstractValidator<OpeningHour>
{
    public OpeningHourValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.Range).NotNull();
    }
}

public class OpeningHourConfiguration : IEntityTypeConfiguration<OpeningHour>
{
    public void Configure(EntityTypeBuilder<OpeningHour> builder)
    {
        builder.Property(x => x.Name).HasMaxLength(255);

        builder.OwnsOne(x => x.Range, b =>
        {
            b.Property(x => x.Start).HasColumnName("TimeRange_Start");
            b.Property(x => x.End).HasColumnName("TimeRange_End");
        });
    }
} 