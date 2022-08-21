using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Maps.Common;

namespace Zeta.Inpark.Maps.Entities;

public class Ping : Entity
{
    public Guid Id { get; private set; }
    public User User { get; private set; } = null!;
    public double Latitude { get; private set; }
    public double Longitude { get; private set; }

    private Ping()
    {
    }

    public static Ping Create(Guid id, User user, double latitude, double longitude)
    {
        var instance = new Ping
        {
            Id = id,
            User = user,
            Latitude = latitude,
            Longitude = longitude
        };
        instance.Validate();
        
        user.AddLocationPing(instance);

        return instance;
    }
}

public class PingValidator : AbstractValidator<Ping>
{
    public PingValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.User).NotNull();
        RuleFor(x => x.Latitude)
            .NotEmpty()
            .GreaterThanOrEqualTo(-90)
            .LessThanOrEqualTo(90);
        RuleFor(x => x.Longitude)
            .NotEmpty()
            .GreaterThanOrEqualTo(-180)
            .LessThanOrEqualTo(180);
    }
}

public class PingConfiguration : IEntityTypeConfiguration<Ping>
{
    public void Configure(EntityTypeBuilder<Ping> builder)
    {
        builder.HasOne(x => x.User)
            .WithMany(x => x.Pings);
    }
}