using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Common;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.OpeningHours.Models;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Entities;

public class OpeningHour : Entity
{
    private OpeningHour() { }

    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public TimeRange Range { get; private set; } = null!;
    public WeekDay Days { get; private set; }
    public bool Open { get; private set; }

    private Dictionary<string, string> _fields = new();
    public IReadOnlyDictionary<string, string> Fields
    {
        get => _fields;
        private set => _fields = (Dictionary<string, string>)value;
    }

    public static OpeningHour Create(Guid id, string name, TimeRange range, WeekDay days, bool open, 
        OpeningHourFields fields)
    {
        var instance = new OpeningHour
        {
            Id = id,
            Name = name,
            Range = range,
            Open = open,
            Days = days,
            Fields = fields,
        };
        instance.Validate();

        return instance;
    }

    public void SetField(string key, string value)
    {
        _fields[key] = value;
    }
}

public class OpeningHourValidator : AbstractValidator<OpeningHour>
{
    public OpeningHourValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty().MaximumLength(255);
        RuleFor(x => x.Range).NotNull();
        RuleFor(x => x.Days).IsInEnum();
        RuleFor(x => x.Fields).NotNull();
    }
}

public class OpeningHourConfiguration : IEntityTypeConfiguration<OpeningHour>
{
    public void Configure(EntityTypeBuilder<OpeningHour> builder)
    {
        builder.Ignore(x => x.Fields);
        
        builder.Property(x => x.Name).HasMaxLength(255);

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