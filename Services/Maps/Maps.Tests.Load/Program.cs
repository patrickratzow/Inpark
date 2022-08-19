using System.Net;
using System.Text;
using NBomber.CSharp;
using System.Text.Json;
using NBomber.Plugins.Network.Ping;
using HttpClientFactory = NBomber.Plugins.Http.CSharp.HttpClientFactory;
using Response = NBomber.Contracts.Response;

var random = new Random();

var httpFactory = HttpClientFactory.Create();
var step = Step.Create("step", httpFactory, async context =>
{
    var data = new
    {
        Latitude = -90 + (random.NextDouble() * 180),
        Longitude = -180 + (random.NextDouble() * 360)
    };
    var jsonData = JsonSerializer.Serialize(data, new JsonSerializerOptions()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    });
    var body = new StringContent(jsonData, Encoding.UTF8, "application/json");
    var response =
        await context.Client.PostAsync(
            "https://func-zeta-maps-northeurope-dev-01.azurewebsites.net/api/ping-location",
            body);

    return response.StatusCode == HttpStatusCode.NoContent
        ? Response.Ok()
        : Response.Fail(statusCode: (int)response.StatusCode);
});
            
// second, we add our step to the scenario
var scenario = ScenarioBuilder
    .CreateScenario("maps_ping", step)
    .WithWarmUpDuration(TimeSpan.FromSeconds(5))
    .WithLoadSimulations(
        Simulation.InjectPerSec(rate: 500, during: TimeSpan.FromSeconds(30))
    );

// creates ping plugin that brings additional reporting data
var pingPluginConfig = PingPluginConfig.CreateDefault(new[] { "func-zeta-maps-northeurope-dev-01.azurewebsites.net" });
var pingPlugin = new PingPlugin(pingPluginConfig);

NBomberRunner
    .RegisterScenarios(scenario)
    .WithWorkerPlugins(pingPlugin)
    .Run();