using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using DomainFixture;
using DomainFixture.FixtureBuilder;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Moq;

namespace Zeta.Inpark.Auth.Tests;

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

    protected async Task<TResponse> Send<TResponse>(IRequest<TResponse> request, params Mock[] mocks)
    {
        var requestType = request.GetType();
        var handlerType = requestType.Assembly
            .GetExportedTypes()
            .First(x => x.Name.Contains(requestType.Name + "Handler"));
        var ctor = handlerType.GetConstructors().First();
        var parameters = ctor.GetParameters();
        var parameterInstances = new List<object>();
        foreach (var parameterInfo in parameters)
        {
            var mock = mocks.FirstOrDefault(x => x.GetType().GenericTypeArguments.First() == parameterInfo.ParameterType);
            if (mock is null)
            {
                parameterInstances.Add(Scope.ServiceProvider.GetRequiredService(parameterInfo.ParameterType));
                
                continue;
            }
            
            parameterInstances.Add(mock.Object);
        }
        var handler = ctor.Invoke(parameterInstances.ToArray());
        var handleMethod = handler.GetType().GetMethods().First(x => x.Name.Contains("Handle"));

        return await (Task<TResponse>)handleMethod.Invoke(handler, new object[] { request, CancellationToken.None })!;
    }

    protected async Task<TEntity?> Find<TEntity>(params object[] keyValues)
        where TEntity : class
    {
        return await DbContext.FindAsync<TEntity>(keyValues);
    }
    
    protected async Task ShouldFind<TEntity>(params object[] keyValues)
        where TEntity : class
    {
        var entity = await Find<TEntity>(keyValues);
        entity.Should().NotBeNull();
    }
    
    protected async Task ShouldNotFind<TEntity>(params object[] keyValues)
        where TEntity : class
    {
        var entity = await Find<TEntity>(keyValues);
        entity.Should().BeNull();
    }

    protected async Task<TEntity> Add<TEntity>(TEntity entity)
        where TEntity : class
    {
        var entry = await DbContext.AddAsync(entity);
        await DbContext.SaveChangesAsync();

        return entry.Entity;
    }
    
    protected async Task<TEntity> Create<TEntity>(
        Func<FixtureBuilder<TEntity>, FixtureBuilder<TEntity>>? fixtureBuilder = null
    )
        where TEntity : class
    {
        var fixture = Fixture.Valid<TEntity>();
        if (fixtureBuilder is not null)
        {
            fixture = fixtureBuilder(fixture);
        }
        var entity = fixture.Create();
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