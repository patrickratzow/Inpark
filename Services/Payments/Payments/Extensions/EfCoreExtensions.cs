using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Zoo.Payments.Common;

namespace Zoo.Payments.Extensions;

public static class EfCoreExtensions
{
    public static ValueTask<T?> FindByKey<T>(this DbSet<T> dbSet, object key, CancellationToken cancellationToken)
        where T : class
        => dbSet.FindAsync(new[]
        {
            key
        }, cancellationToken);
    
    /// <summary>
    /// Shortcut for OwnsOne with 1 property
    /// </summary>
    /// <param name="builder"></param>
    /// <param name="navigationExpression"></param>
    /// <param name="propertyExpression"></param>
    /// <param name="propertyBuilder"></param>
    /// <param name="navigationBuilder"></param>
    /// <param name="name"></param>
    /// <param name="addProperty"></param>
    /// <typeparam name="TEntity"></typeparam>
    /// <typeparam name="TRelatedEntity"></typeparam>
    /// <typeparam name="TProperty"></typeparam>
    /// <returns></returns>
    /// <exception cref="ArgumentNullException"></exception>
    /// <exception cref="ArgumentException"></exception>
    public static EntityTypeBuilder<TEntity> Primitive<TEntity, TRelatedEntity, TProperty>(
        this EntityTypeBuilder<TEntity> builder,
        Expression<Func<TEntity, TRelatedEntity?>> navigationExpression,
        Expression<Func<TRelatedEntity, TProperty>> propertyExpression,
        Action<PropertyBuilder<TProperty>>? propertyBuilder = null,
        Action<OwnedNavigationBuilder<TEntity, TRelatedEntity>>? navigationBuilder = null,
        string? name = null,
        bool addProperty = true
    )
        where TEntity : class
        where TRelatedEntity : ValueObject
    {
        if (navigationExpression is null) throw new ArgumentNullException(nameof(navigationExpression));
        if (name is null)
        {
            if (navigationExpression.Body is not MemberExpression bodyProperty)
                throw new ArgumentException(nameof(navigationExpression));

            // Figure out the name automatically if no name is supplied
            name = bodyProperty.Member.Name;
        }

        builder.OwnsOne(navigationExpression, b =>
        {
            if (addProperty)
            {
                var property = b.Property(propertyExpression);
                propertyBuilder?.Invoke(property);
                property.HasColumnName(name);
            }

            navigationBuilder?.Invoke(b);
        });

        return builder;
    }
}