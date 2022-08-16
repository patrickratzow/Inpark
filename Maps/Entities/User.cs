using FluentValidation;
using Zeta.Inpark.Maps.Common;

namespace Zeta.Inpark.Maps.Entities;

public class User : Entity
{
    public Guid Id { get; private set; }
    private List<LocationPing> _locationPings = new();
    public IReadOnlyList<LocationPing> LocationPings
    {
        get => _locationPings;
        set => _locationPings = (List<LocationPing>)value;
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

    public void AddLocationPing(double latitude, double longitude)
    {
        var ping = new LocationPing();
        
        _locationPings.Add(ping);
    }
}

public class UserValidator : AbstractValidator<User>
{
    public UserValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
    }
}