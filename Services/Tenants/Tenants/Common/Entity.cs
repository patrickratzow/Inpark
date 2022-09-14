using FluentValidation;

namespace Zeta.Inpark.Tenants.Common;

public abstract class Entity : IValidatable, IHasDomainEvent
{
    private readonly List<DomainEvent> _domainEvents = new();

    public DateTimeOffset CreatedAt { get; protected set; }
    public DateTimeOffset UpdatedAt { get; protected set; }
    public IReadOnlyList<DomainEvent> DomainEvents => _domainEvents;
    public void AddDomainEvent(DomainEvent domainEvent) { _domainEvents.Add(domainEvent); }

    public virtual void Validate() => ValidationService.Validate(this, typeof(Entity));
}

public class EntityValidator : AbstractValidator<Entity>
{
    public EntityValidator()
    {
        RuleFor(x => x.CreatedAt).LessThanOrEqualTo(_ => DateTime.Now);
        RuleFor(x => x.UpdatedAt).LessThanOrEqualTo(_ => DateTime.Now);
        RuleFor(x => x.DomainEvents).NotNull();
    }
}