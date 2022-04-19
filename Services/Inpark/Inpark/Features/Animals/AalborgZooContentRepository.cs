using System.Net;
using Microsoft.Extensions.Logging;

namespace Zoo.Inpark.Features.Animals;

public interface IAalborgZooContentRepository
{
    ValueTask<Result<string, string>> GetContent();
}

public class AalborgZooContentRepository : IAalborgZooContentRepository
{
    private const string Query =
        "{\"area\":{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"},\"facets\":[{\"type\":\"CheckboxOr\",\"field\":\"data.properties.category\"}],\"skip\":0,\"take\":1000,\"search\":{\"type\":\"and\",\"queries\":[],\"weighted\":false},\"lookupTemplate\":\"animal\",\"sorting\":[]}";
    
    private readonly HttpClient _client;
    private readonly ILogger<AalborgZooContentRepository> _logger;

    public AalborgZooContentRepository(HttpClient client, ILogger<AalborgZooContentRepository> logger)
    {
        _client = client;
        _logger = logger;
    }


    public async ValueTask<Result<string, string>> GetContent()
    {
        _logger.BeginScope("Aalborg Zoo - Animal content!");
        
        try
        {
            _logger.LogInformation("Getting Animal content");
            
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