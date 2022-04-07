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
        var overview = _cache.GetOrCreateAsync("zoo_animals", async entry =>
        {
            entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromMinutes(5);
            
            try
            {
                var httpContent = new StringContent(
                    "{\"area\":{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"},\"facets\":[{\"type\":\"CheckboxOr\",\"field\":\"data.properties.category\"}],\"skip\":0,\"take\":1000,\"search\":{\"type\":\"and\",\"queries\":[],\"weighted\":false},\"lookupTemplate\":\"animal\",\"sorting\":[]}");
                httpContent.Headers.ContentType = new("application/json");
                var response = await _client.PostAsync("Content/GetElementsBySearch", httpContent);
                response.EnsureSuccessStatusCode();
                
                var jsonString = await response.Content.ReadAsStringAsync();
                
                using var json = JsonDocument.Parse(jsonString);
                var items = json.RootElement.GetProperty("items");
                var animals = new List<Animal>();
                foreach (var itemJson in items.EnumerateArray())
                {
                    var item = itemJson.GetProperty("item");
                    var properties = item.GetProperty("properties");
                    var url = item.GetProperty("url").GetString();
                    var animalName = ParseAnimalName(properties);
                    var category = properties.GetProperty("category").GetString();
                    var content = item.GetProperty("content");
                    var previewImage = properties.GetProperty("image")
                        .GetProperty("umbracoFile")
                        .GetProperty("src");
                    var fullscreenImage = properties.GetProperty("imageFullscreen")
                        .GetProperty("umbracoFile")
                        .GetProperty("src");
                    var baseUrl = "https://cms.aalborgzoo.dk";
                    var image = new AnimalImage(
                        $"{baseUrl}{previewImage}",
                        $"{baseUrl}{fullscreenImage}"
                    );

                    var contents = new List<AnimalContent>();
                    foreach (
                        var animalArrayContent in 
                        from itemContentJson in content.EnumerateArray() 
                        select itemContentJson.GetProperty("content") into animalContentJson
                        from animalArrayContent in animalContentJson.EnumerateArray() 
                        from animalContent in animalArrayContent.EnumerateArray() 
                        select animalArrayContent
                    )
                    {
                        var animalContent = animalArrayContent.EnumerateArray().First();
                        var type = animalContent.GetProperty("type").GetString();
                        var text = type switch {
                            "text" or "headline" => ParseText(animalContent),
                            "header" => ParseHeader(animalContent),
                            "image" => ParseImage(animalContent),
                            _ => throw new ArgumentOutOfRangeException(nameof(type), type, "Unknown animal type")
                        };
                        
                        contents.Add(new(text, type));
                    }

                    var animal = new Animal(
                        animalName,
                        category,
                        image, 
                        url,
                        contents
                    );
                    
                    animals.Add(animal);
                }

                return new AnimalOverview(
                    animals,
                    animals.Select(x => x.Category).Distinct().ToList()
                );
            }
            catch (Exception ex)
            {
                _logger.LogError("Unable to get overview of animals. Exception: {Exception}", ex);
                
                return null;
            }
        });

        return new(overview);
    }

    private static string ParseText(JsonElement content)
    {
        var text = content.GetProperty("text").GetString();
        if (text is null) throw new NullReferenceException("No text found");

        return text;
    }
    
    private static string ParseHeader(JsonElement content)
    {
        var text = content.GetProperty("header").GetString();
        if (text is null) throw new NullReferenceException("No text found");

        return text;
    }
    
    private static string ParseImage(JsonElement content)
    {
        var text = content.GetProperty("image").GetString();
        if (text is null) throw new NullReferenceException("No text found");

        return text;
    }
    
    private static AnimalName ParseAnimalName(JsonElement properties)
    {
        var displayName = properties.GetProperty("nonLatinName").GetString();
        var latinName = properties.GetProperty("latinName").GetString();
        var animalName = new AnimalName(displayName!, latinName!);
        return animalName;
    }
}