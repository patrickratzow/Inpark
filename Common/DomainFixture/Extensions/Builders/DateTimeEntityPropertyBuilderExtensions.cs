namespace DomainFixture;

public static class DateTimeEntityPropertyBuilderExtensions
{
    public static IGenericPropertyBuilder<DateTimeOffset, TEntity> ShouldBeInTheFuture<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.UtcNow.AddSeconds(10));
        propertyBuilder.Invalid(_ => DateTimeOffset.UtcNow.AddSeconds(-10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTimeOffset?, TEntity> ShouldBeInTheFuture<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.UtcNow.AddSeconds(10));
        propertyBuilder.Invalid(_ => DateTimeOffset.UtcNow.AddSeconds(-10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTimeOffset, TEntity> ShouldBeInThePast<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.UtcNow.AddSeconds(-10));
        propertyBuilder.Invalid(_ => DateTimeOffset.UtcNow.AddSeconds(10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTimeOffset?, TEntity> ShouldBeInThePast<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.UtcNow.AddSeconds(-10));
        propertyBuilder.Invalid(_ => DateTimeOffset.UtcNow.AddSeconds(10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTimeOffset, TEntity> ShouldBeNow<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.UtcNow);

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTimeOffset?, TEntity> ShouldBeNow<TEntity>(
        this IGenericPropertyBuilder<DateTimeOffset?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTimeOffset.Now);

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime, TEntity> ShouldBeInTheFuture<TEntity>(
        this IGenericPropertyBuilder<DateTime, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now.AddSeconds(10));
        propertyBuilder.Invalid(_ => DateTime.Now.AddSeconds(-10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime?, TEntity> ShouldBeInTheFuture<TEntity>(
        this IGenericPropertyBuilder<DateTime?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now.AddSeconds(10));
        propertyBuilder.Invalid(_ => DateTime.Now.AddSeconds(-10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime, TEntity> ShouldBeInThePast<TEntity>(
        this IGenericPropertyBuilder<DateTime, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now.AddSeconds(-10));
        propertyBuilder.Invalid(_ => DateTime.Now.AddSeconds(10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime?, TEntity> ShouldBeInThePast<TEntity>(
        this IGenericPropertyBuilder<DateTime?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now.AddSeconds(-10));
        propertyBuilder.Invalid(_ => DateTime.Now.AddSeconds(10));

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime, TEntity> ShouldBeNow<TEntity>(
        this IGenericPropertyBuilder<DateTime, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now);

        return propertyBuilder;
    }

    public static IGenericPropertyBuilder<DateTime?, TEntity> ShouldBeNow<TEntity>(
        this IGenericPropertyBuilder<DateTime?, TEntity> propertyBuilder)
    {
        propertyBuilder.Valid(_ => DateTime.Now);

        return propertyBuilder;
    }
}