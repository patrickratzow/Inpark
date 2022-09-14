using FluentValidation;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zeta.Inpark.Tenants.Common;

namespace Zeta.Inpark.Tenants.Entities;

public class Feature : Entity
{
    public Guid Id { get; private set; }
    public string FeatureId { get; private set; } = null!;
    public DateTime? DeactivatedAt { get; private set; } = null!;
    public string Data { get; private set; } = null!;

    private Feature(){}

    public static Feature Create(Guid id, string featureId, string data)
    {
        var instance = new Feature()
        {
            Id = id,
            FeatureId = featureId,
            Data = data,
        };
        instance.Validate();

        return instance;
    }

    public void UpdateData(string data)
    {
        Data = data;
    }
}

public class FeatureValidator : AbstractValidator<Feature>
{
    public FeatureValidator()
    {
        RuleFor(x => x.Id).NotEmpty();
        RuleFor(x => x.FeatureId).NotEmpty()
            .MaximumLength(255);
        RuleFor(x => x.DeactivatedAt)
            .LessThanOrEqualTo(x => DateTime.Now);
        RuleFor(x => x.Data).NotEmpty();
    }
}

public class FeatureConfiguration : IEntityTypeConfiguration<Feature>
{
    public void Configure(EntityTypeBuilder<Feature> builder)
    {
        builder.HasIndex(nameof(Feature.Id), "ServiceId")
            .IsUnique();
        builder.Property<Guid>("ServiceId");
        builder.Property(x => x.FeatureId).HasMaxLength(255);
        builder.Property(t => t.Data);
    }
}