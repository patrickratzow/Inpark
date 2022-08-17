using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Maps.Common;

namespace Zeta.Inpark.Maps.Entities;

public class User : Entity
{
    public Guid Id { get; private set; }
    private List<Ping> _pings = new();
    public IReadOnlyList<Ping> Pings
    {
        get => _pings;
        set => _pings = (List<Ping>)value;
    }

    private User()
    {
    }
    
    public static User Create(Guid id)
    {
        var instance = new User
        {
            Id = id
        };
        instance.Validate();

        return instance;
    }

    public void AddLocationPing(Ping ping) => _pings.Add(ping);
}

public class UserValidator : AbstractValidator<User>
{
    public UserValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
    }
}

public class UserConfiguration : IEntityTypeConfiguration<User>
{
    public void Configure(EntityTypeBuilder<User> builder)
    {
        builder.HasMany(x => x.Pings)
            .WithOne(x => x.User);
    }
}