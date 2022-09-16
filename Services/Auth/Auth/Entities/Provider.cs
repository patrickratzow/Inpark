using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Zeta.Inpark.Auth.Entities;

public abstract class Provider : Entity
{
    public string Id { get; protected set; }
    
    protected Provider()
    {
    }
}

public class ProviderValidator : AbstractValidator<Provider>
{
    public ProviderValidator()
    {
        RuleFor(p => p.Id).NotEmpty();
    }
}

public class ProviderConfiguration : IEntityTypeConfiguration<Provider>
{
    public void Configure(EntityTypeBuilder<Provider> builder)
    {
        builder.Property<Guid>("UserId");
        builder.HasKey("Id", "UserId");
    }
}