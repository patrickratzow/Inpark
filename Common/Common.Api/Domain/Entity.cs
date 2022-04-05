using FluentValidation;

namespace Zoo.Common.Api;

public abstract class Entity : IValidatable, IHasDomainEvent
{
    private readonly List<DomainEvent> _domainEvents = new();

    public DateTime CreationDate { get; protected set; }
    public DateTime ModificationDate { get; protected set; }
    public IReadOnlyList<DomainEvent> DomainEvents => _domainEvents;
    public void AddDomainEvent(DomainEvent domainEvent) { _domainEvents.Add(domainEvent); }

    public virtual void Validate() => ValidationService.Validate(this, typeof(Entity));
}

public class EntityValidator : AbstractValidator<Entity>
{
    public EntityValidator()
    {
        RuleFor(x => x.CreationDate).LessThanOrEqualTo(_ => DateTime.Now);
        RuleFor(x => x.ModificationDate).LessThanOrEqualTo(_ => DateTime.Now);
        RuleFor(x => x.DomainEvents).NotNull();
    }
}