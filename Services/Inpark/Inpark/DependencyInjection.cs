using System.Reflection;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using Polly;
using Polly.Extensions.Http;
using Zoo.Inpark.Features.Animals.Providers;

namespace Zoo.Inpark;

public static class DependencyInjection
{
    public static void AddInpark(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddMemoryCache();
        services.AddMediatR(Assembly.GetExecutingAssembly());
        services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

        services.AddSingleton<IAnimalProvider, AalborgZooAnimalProvider>();
        services.AddHttpClient<IAnimalProvider, AalborgZooAnimalProvider>(httpClient =>
            {
                httpClient.BaseAddress = new("https://api.aalborgzoo.dk/api/");
            })
            .AddPolicyHandler(GetRetryPolicy());
        
        
        services.AddResponseMapper();
    }

    public static void UseInpark(this IApplicationBuilder app)
    {
        app.UseResponseMapper();
    }
    
    private static IAsyncPolicy<HttpResponseMessage> GetRetryPolicy()
    {
        return HttpPolicyExtensions
            .HandleTransientHttpError()
            .OrResult(msg => msg.StatusCode == System.Net.HttpStatusCode.NotFound)
            .WaitAndRetryAsync(3, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2,
                retryAttempt)));
    }
}