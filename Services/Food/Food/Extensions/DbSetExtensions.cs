using Microsoft.EntityFrameworkCore;

namespace Zeta.Inpark.Food.Extensions;

public static class DbSetExtensions
{
    public static async ValueTask<TEntity> FindOrFailAsync<TEntity, TPrimaryKey>(
        this DbSet<TEntity> dbSet,
        TPrimaryKey primaryKey, 
        CancellationToken cancellationToken
    ) where TEntity : class
    {
        var entityType = typeof(TEntity);
        var entity = await dbSet.FindAsync(new object?[] { primaryKey }, cancellationToken);
        if (entity is null) 
            throw new($"Unable to find any {entityType.Name} with the Primary Key {primaryKey}");

        return entity;
    }
}