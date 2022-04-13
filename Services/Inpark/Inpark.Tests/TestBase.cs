using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Zoo.Inpark.Tests;

using static Testing;

public abstract class TestBase
{
    protected IServiceScope Scope => Testing.Scope;

    [SetUp]
    public virtual async Task Setup()
    {
        await ResetState();
        ResetScope();
    }

    protected TService GetRequiredService<TService>()
        where TService : notnull =>
        Scope.ServiceProvider.GetRequiredService<TService>();

    protected async Task<TResponse> Send<TResponse>(IRequest<TResponse> request)
    {
        ResetScope();

        var mediator = Scope.ServiceProvider.GetRequiredService<ISender>();

        return await mediator.Send(request);
    }

    protected async Task<TEntity?> Find<TEntity>(params object[] keyValues)
        where TEntity : class
    {
        return await DbContext.FindAsync<TEntity>(keyValues);
    }

    protected async Task<TEntity> Add<TEntity>(TEntity entity)
        where TEntity : class
    {
        var entry = await DbContext.AddAsync(entity);
        await DbContext.SaveChangesAsync();

        return entry.Entity;
    }

    protected async Task<int> Update<TEntity>(TEntity entity)
        where TEntity : class
    {
        DbContext.Update(entity);

        return await DbContext.SaveChangesAsync();
    }

    protected async Task AddRange(params object[] entities)
    {
        await DbContext.AddRangeAsync(entities);
        await DbContext.SaveChangesAsync();
    }

    protected async Task AddRange(IEnumerable<object> entities)
    {
        await DbContext.AddRangeAsync(entities);
        await DbContext.SaveChangesAsync();
    }

    protected async Task<int> Count<TEntity>()
        where TEntity : class
    {
        return await DbContext.Set<TEntity>()
            .CountAsync();
    }

    protected DbSet<TEntity> Search<TEntity>()
        where TEntity : class
    {
        return DbContext.Set<TEntity>();
    }

    public static void SetProperty<TEntity, TValue>(TEntity entity, Expression<Func<TEntity, TValue>> expression,
        TValue newValue)
    {
        if (expression.Body is not MemberExpression memberExpression)
            throw new ArgumentException(nameof(expression));

        // Figure out the name automatically if no name is supplied
        var name = memberExpression.Member.Name;
        var property = entity!.GetType()
            .GetProperty(name, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
        if (property is null) throw new ArgumentException("Unable to get property", nameof(expression));

        property.SetValue(entity, newValue);
    }
}