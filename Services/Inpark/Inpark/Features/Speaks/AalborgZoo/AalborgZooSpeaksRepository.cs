using System.Net;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Features.Speaks.Interfaces;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.Speaks.AalborgZoo;

public class AalborgZooSpeaksRepository : ISpeaksRepository
{
    private readonly HttpClient _client;
    private readonly ILogger<AalborgZooSpeaksRepository> _logger;

    public AalborgZooSpeaksRepository(HttpClient client, ILogger<AalborgZooSpeaksRepository> logger)
    {
        _client = client;
        _logger = logger;
    }
    
        public async ValueTask<Result<string, string>> GetRange(TimeRange range)
    {
        _logger.BeginScope("Aalborg Zoo - Speaks. Range {Range}", range);
        
        try
        {
            _logger.LogInformation("Getting speaks");
            
            var request = BuildRequest(range);
            var response = await _client.PostAsync("Content/GetElementsBySearch", request);

            _logger.LogInformation("Got speaks. Response status code: {StatusCode}", 
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
                "Exception occured while getting speaks for Aalborg Zoo. Exception: {Exception}", ex);
            
            return Result<string, string>.Error(ex.ToString());
        }
    }

    private static HttpContent BuildRequest(TimeRange range)
    {
        var start = range.Start.ToString("yyyy-MM-dd");
        var end = range.End.ToString("yyyy-MM-dd");
        var body =
            $"{{\"area\":{{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"}},\"facets\":[],\"skip\":0,\"take\":1000,\"search\":{{\"type\":\"and\",\"queries\":[{{\"type\":\"and\",\"weighted\":false,\"queries\":[{{\"type\":\"range\",\"field\":\"data.properties.times.start\",\"lte\":\"{start}\"}},{{\"type\":\"range\",\"field\":\"data.properties.times.end\",\"gte\":\"{end}\"}}]}}],\"weighted\":false}},\"lookupTemplate\":\"activity\",\"sorting\":[{{\"field\":\"data.properties.times.start\",\"direction\":\"Ascending\"}}]}}";
        
        var content = new StringContent(body);
        content.Headers.ContentType = new("application/json");
        
        return content;
    }
    
}