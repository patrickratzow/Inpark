using System.Text.Json;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Contracts;

namespace Zoo.Inpark.Features.Animals.Providers;

public class AalborgZooAnimalProvider : IAnimalProvider
{
    private readonly IMemoryCache _cache;
    private readonly HttpClient _client;
    private readonly ILogger<AalborgZooAnimalProvider> _logger;

    public AalborgZooAnimalProvider(IMemoryCache cache, HttpClient client, ILogger<AalborgZooAnimalProvider> logger)
    {
        _cache = cache;
        _client = client;
        _logger = logger;
    }

    public ValueTask<AnimalOverview?> GetOverview()
    {
        var overview = _cache.GetOrCreate("zoo_animals", async entry =>
        {
            entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(5);
            
            try
            {
                var httpContent = new StringContent(
                    "{\"area\":{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"},\"facets\":[{\"type\":\"CheckboxOr\",\"field\":\"data.properties.category\"}],\"skip\":0,\"take\":1000,\"search\":{\"type\":\"and\",\"queries\":[],\"weighted\":false},\"lookupTemplate\":\"animal\",\"sorting\":[]}");
                httpContent.Headers.ContentType = new("application/json");
                var response = await _client.PostAsync("Content/GetElementsBySearch", httpContent);
                response.EnsureSuccessStatusCode();
                
                var content = await response.Content.ReadAsStringAsync();
                var animals = JsonSerializer.Deserialize<AnimalOverview>(content, new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true
                });
                return animals;
            }
            catch (Exception ex)
            {
                _logger.LogError("Unable to get overview of animals. Exception: {Exception}", ex);
                
                return null;
            }
        });

        return new(overview);
    }

    public ValueTask<Animal?> GetAnimal(string id)
    {
        throw new NotImplementedException();
    }
    
    public class SearchResult
    {
        public List<SearchItem> Items { get; set; } = new();
    }

    public class SearchItem
    {
        
    }
}