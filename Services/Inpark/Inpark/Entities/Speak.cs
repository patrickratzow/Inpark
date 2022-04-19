using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Inpark.Common;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Entities;

public class Speak : Entity
{
    private Speak() {}
        
    public Guid Id { get; private set; }
    public string Title { get; private set; } = null!;
    private List<SpeakTime> _speakTimes = new List<SpeakTime>();
    public IReadOnlyCollection<SpeakTime> SpeakTimes
    {
        get => _speakTimes;
        private set => _speakTimes = value.ToList();
    }
   
    public static Speak Create(Guid id, string title, List<SpeakTime> speakTimes)
    {
        var instance = new Speak()
        {
            Id = id,
            Title = title,
            SpeakTimes = speakTimes
        };
        instance.Validate();
        
        return instance;
    }
}

public class SpeakValidator : AbstractValidator<Speak>
{
    public SpeakValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Title).NotEmpty();
        RuleFor(x => x.SpeakTimes).NotNull();
    }
}

public class SpeakConfiguration : IEntityTypeConfiguration<Speak>
{
    public void Configure(EntityTypeBuilder<Speak> builder)
    {
        builder.Property(x => x.Title).HasMaxLength(255);
        builder.OwnsMany(x => x.SpeakTimes, b =>
        {
            b.Property<Guid>("Id");
            b.HasKey("Id");
            
            b.OwnsOne(x => x.Range, b =>
            {
                b.HasIndex(x => new
                {
                    x.Start,
                    x.End
                });
                b.Property(x => x.Start).HasColumnName("TimeRange_Start");
                b.Property(x => x.End).HasColumnName("TimeRange_End");
            });
            
            b.Property<Guid>("SpeakId");
            b.WithOwner().HasForeignKey("SpeakId");
        } );
    }
}