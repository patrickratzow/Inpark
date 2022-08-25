using System.Net;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Features.ParkEvents.Interfaces;

namespace Zeta.Inpark.Features.ParkEvents.AalborgZoo;

public class AalborgZooParkEventRepository : IParkEventRepository
{
    private const string Query =
        "{\"area\":{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"},\"facets\":[],\"skip\":0,\"take\":1000,\"search\":{\"type\":\"and\",\"queries\":[{\"type\":\"and\",\"weighted\":false,\"queries\":[{\"type\":\"range\",\"field\":\"data.properties.times.end\",\"gte\":\"2022-04-22\"},{\"type\":\"equals\",\"field\":\"data.properties.times.type\",\"value\":\"Event\"}]}],\"weighted\":false},\"lookupTemplate\":\"activity\",\"sorting\":[{\"field\":\"data.properties.times.start\",\"direction\":\"Ascending\"}]}";

    private readonly HttpClient _client;
    private readonly ILogger<AalborgZooParkEventRepository> _logger;

    public AalborgZooParkEventRepository(HttpClient client, ILogger<AalborgZooParkEventRepository> logger)
    {
        _client = client;
        _logger = logger;
    }

    public async ValueTask<Result<string, string>> GetContent()
    {
        _logger.BeginScope("Aalborg Zoo - Event content!");

        try
        {
            _logger.LogInformation("Getting Event content");

            var httpContent = new StringContent(Query);
            httpContent.Headers.ContentType = new("application/json");
            var response = await _client.PostAsync("Content/GetElementsBySearch", httpContent);

            _logger.LogInformation("Got content. Response status code: {StatusCode}",
                response.StatusCode.ToString());

            if (response.StatusCode is not HttpStatusCode.OK)
            {
                _logger.LogError("Got unexpected status code. The code was {Code}", response.StatusCode);

                return Result<string, string>.Error("Unexpected response from API");
            }

            var content = await response.Content.ReadAsStringAsync();
            return Result<string, string>.Success(content);
        }
        catch (Exception ex)
        {
            _logger.LogError(
                "Exception occured while getting content for Aalborg Zoo. Exception: {Exception}", ex);

            return Result<string, string>.Error(ex.ToString());
        }
    }
}

