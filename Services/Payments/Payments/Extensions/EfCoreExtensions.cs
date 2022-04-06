using Microsoft.EntityFrameworkCore;

namespace Zoo.Payments.Extensions;

public static class EfCoreExtensions
{
    public static ValueTask<T?> FindByKey<T>(this DbSet<T> dbSet, object key, CancellationToken cancellationToken)
        where T : class
        => dbSet.FindAsync(new[]
        {
            key
        }, cancellationToken);
}