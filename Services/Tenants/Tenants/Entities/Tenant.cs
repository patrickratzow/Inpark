using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Tenants.Common;
using Zeta.Inpark.Tenants.ValueObjects;

namespace Zeta.Inpark.Tenants.Entities;

public class Tenant : Entity
{
    public Guid Id { get; private set; }
    public string Name { get; private set; } = null!;
    public string ImageUrl { get; private set; } = null!;
    public Address Address { get; private set; } = null!;
    public GpsLocation Location { get; private set; } = null!;

    private List<Service> _services = new();
    public IReadOnlyCollection<Service> Services
    {
        get => _services;
        private set => _services = value.ToList();
    }

    private Tenant() { }

    public static Tenant Create(Guid id, string name)
    {
        var instance = new Tenant()
        {
            Id = id,
            Name = name,
        };
        instance.Validate();

        return instance;
    }

    public bool AddService(Service service)
    {
        if (_services.Any(x => x.Id == service.Id)) return false;

        _services.Add(service);
        AddDomainEvent(new AddedServiceToTenant(this, service));

        return true;
    }
}

public record AddedServiceToTenant : DomainEvent
{
    public Tenant Tenant { get; }
    public Service Service { get; }
    
    public AddedServiceToTenant(Tenant tenant, Service service)
    {
        Tenant = tenant;
        Service = service;
    }
}

public class TenantValidator : AbstractValidator<Tenant>
{
    public TenantValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.Name).NotEmpty()
            .MaximumLength(255);
        RuleFor(x => x.ImageUrl).NotEmpty();
        RuleFor(x => x.Address).NotNull();
        RuleFor(x => x.Location).NotNull();
        RuleFor(x => x.Services).NotNull();
    }
}

public class TenantConfiguration : IEntityTypeConfiguration<Tenant>
{
    public void Configure(EntityTypeBuilder<Tenant> builder)
    {
        builder.Property(x => x.Name).HasMaxLength(255);
        builder.HasMany(x => x.Services)
            .WithOne()
            .HasForeignKey("TenantId");
        builder.OwnsOne(x => x.Address);
        builder.OwnsOne(x => x.Location);
    }
}
