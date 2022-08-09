using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public class Permission : Entity
{
    public string Id { get; private set; }
    private List<Role> _roles = new();
    public IReadOnlyList<Role> Roles
    {
        get => _roles;
        private set => _roles = new(value);
    }

    private Permission() {}
    
    public static Permission Create(string id)
    {
        return new Permission
        {
            Id = id
        };
    }
}

public class PermissionValidator : AbstractValidator<Permission>
{
    public PermissionValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
    }
}