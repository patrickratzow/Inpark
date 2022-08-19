using System.Net;
using System.Text;
using NBomber.CSharp;
using NBomber.Plugins.Http.CSharp;
using NBomber.Plugins.Network.Ping;
using System.Text.Json;
using NBomber.Plugins.Http.FSharp;
using Http = NBomber.Plugins.Http.CSharp.Http;
using HttpClientFactory = NBomber.Plugins.Http.CSharp.HttpClientFactory;
using Response = NBomber.Contracts.Response;

var random = new Random();
var step = Step.Create(
    "fetch_html_page",
    clientFactory: HttpClientFactory.Create(),
    execute: context =>
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

        var request = Http.CreateRequest("POST", "http://localhost:7071/api/ping-location")
            .WithBody(body)
            .WithCheck(async (response) =>
                response.StatusCode == HttpStatusCode.NoContent 
                    ? Response.Ok() 
                    : Response.Fail()
                );

        return Http.Send(request, context);
    }
);

var scenario = ScenarioBuilder
    .CreateScenario("simple_http", step)
    .WithWarmUpDuration(TimeSpan.FromSeconds(5))
    .WithLoadSimulations(
        Simulation.InjectPerSec(rate: 100, during: TimeSpan.FromSeconds(30))
    );

// creates ping plugin that brings additional reporting data
var pingPluginConfig = PingPluginConfig.CreateDefault(new[] { "localhost:7252" });
var pingPlugin = new PingPlugin(pingPluginConfig);

NBomberRunner
    .RegisterScenarios(scenario)
    .Run();