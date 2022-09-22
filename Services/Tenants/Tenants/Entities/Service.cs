using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Tenants.Common;

namespace Zeta.Inpark.Tenants.Entities;

public class Service : Entity
{
    public Guid Id { get; private set; }
    public string ServiceId { get; private set; } = null!;
    public DateTime? DeactivatedAt { get; private set; } = null!;
    private List<Feature> _features = new();
    public IReadOnlyCollection<Feature> Features
    {
        get => _features;
        private set => _features = value.ToList();
    }

    private Service() {}
    
    public static Service Create(Guid id, string serviceId, List<Feature> features)
    {
        var instance = new Service()
        {
            Id = id,
            ServiceId = serviceId,
            Features = features
        };
        instance.Validate();

        return instance;
    }

    public void AddFeature(Feature feature) => _features.Add(feature);

    public bool IsDisabled => DeactivatedAt is not null;
}

public class ServiceValidator : AbstractValidator<Service>
{
    public ServiceValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.ServiceId).NotEmpty()
            .MaximumLength(255);
        RuleFor(x => x.DeactivatedAt)
            .LessThanOrEqualTo(x => DateTime.Now);
        RuleFor(x => x.Features).NotNull();
    }
}


public class ServiceConfiguration : IEntityTypeConfiguration<Service>
{
    public void Configure(EntityTypeBuilder<Service> builder)
    {
        builder.HasIndex(nameof(Service.Id), "TenantId")
            .IsUnique();
        builder.Property<Guid>("TenantId");
        builder.Property(x => x.ServiceId).HasMaxLength(255);
        builder.HasMany(x => x.Features)
            .WithOne()
            .HasForeignKey("ServiceId");
    }
}