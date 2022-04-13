namespace DomainFixture;

public static class GuidEntityPropertyBuilderExtensions
{
    public static IGenericPropertyBuilder<Guid, TEntity> NotEmpty<TEntity>(
        this IGenericPropertyBuilder<Guid, TEntity> propertyBuilder)
        => propertyBuilder
            .Valid(_ => Guid.NewGuid())
            .Invalid(Guid.Empty);
}