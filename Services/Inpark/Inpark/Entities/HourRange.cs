using System.Globalization;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Common;

namespace Zeta.Inpark.Entities;

public class HourRange : Entity
{
    private HourRange() {}
        
    public Guid Id { get; private set; }
    public DateTime Start { get; private set; }
    public DateTime End { get; private set; }
    public string Color { get; private set; }

    public static HourRange Create(Guid id, DateTime start, DateTime end, string color)
    {
        var instance = new HourRange
        {
            Id = id,
            Start = start,
            End = end,
            Color = color
        };
        instance.Validate();
        
        return instance;
    }

    public override string ToString() => $"{Start:HH:mm} - {End:HH:mm}";
}

public class HourRangeValidator : AbstractValidator<HourRange>
{
    public HourRangeValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Start).NotNull().LessThanOrEqualTo(x => x.End);
        RuleFor(x => x.End).NotNull().GreaterThanOrEqualTo(x => x.Start);
        RuleFor(x => x.Color)
            .NotEmpty()
            .Length(6)
            // Used to check if the string is a valid hex color
            .Must(x => int.TryParse(x, NumberStyles.HexNumber, CultureInfo.InvariantCulture, out _));
    }
}

public class HourRangeConfiguration : IEntityTypeConfiguration<HourRange>
{
    public void Configure(EntityTypeBuilder<HourRange> builder)
    {
        builder.Property(x => x.Color).HasMaxLength(6).IsFixedLength();
    }
}