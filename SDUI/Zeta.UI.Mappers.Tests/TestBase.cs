using Microsoft.Extensions.DependencyInjection;

namespace Zeta.UI.Mappers.Tests;

using static Testing;

public abstract class TestBase
{
    protected IServiceScope Scope => Testing.Scope;

    [SetUp]
    public virtual async Task Setup()
    {
        ResetScope();
    }

    protected TService GetRequiredService<TService>()
        where TService : notnull =>
        Scope.ServiceProvider.GetRequiredService<TService>();
}