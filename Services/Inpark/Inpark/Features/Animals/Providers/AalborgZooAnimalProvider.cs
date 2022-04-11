using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Models;
using Zoo.Inpark.Services;

namespace Zoo.Inpark.Features.Animals.Providers;

public class AalborgZooAnimalProvider : IAnimalProvider
{
    private const string Query =
        "{\"area\":{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"},\"facets\":[{\"type\":\"CheckboxOr\",\"field\":\"data.properties.category\"}],\"skip\":0,\"take\":1000,\"search\":{\"type\":\"and\",\"queries\":[],\"weighted\":false},\"lookupTemplate\":\"animal\",\"sorting\":[]}";

    private readonly IMemoryCache _cache;
    private readonly HttpClient _client;
    private readonly IHtmlTransformer _htmlTransformer;
    private readonly ILogger<AalborgZooAnimalProvider> _logger;

    public AalborgZooAnimalProvider(IMemoryCache cache, HttpClient client, ILogger<AalborgZooAnimalProvider> logger, 
        IHtmlTransformer htmlTransformer)
    {
        _cache = cache;
        _client = client;
        _logger = logger;
        _htmlTransformer = htmlTransformer;
    }

    public ValueTask<AnimalOverview?> GetOverview()
    {
        var overview = _cache.GetOrCreateAsync("zoo_animals", async entry =>
        {
            entry.AbsoluteExpirationRelativeToNow = TimeSpan.FromHours(12);

            try
            {
                var httpContent = new StringContent(Query);
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

                    var contents = new List<IContent>();
                    foreach (
                        var animalArrayContent in
                        from itemContentJson in content.EnumerateArray()
                        select itemContentJson.GetProperty("content")
                        into animalContentJson
                        from animalArrayContent in animalContentJson.EnumerateArray()
                        from animalContent in animalArrayContent.EnumerateArray()
                        select animalArrayContent
                    )
                    {
                        var animalContent = animalArrayContent.EnumerateArray().First();
                        var type = animalContent.GetProperty("type").GetString();
                        var contentObject = type switch
                        {
                            "text" or "headline" => GetContentValue(animalContent, type),
                            "header" => GetContentValue(animalContent, type, "header"),
                            "image" => GetContentValue(animalContent, type, "image"),
                            _ => throw new ArgumentOutOfRangeException(nameof(type), type, "Unknown animal type")
                        };
                        var parsedContent = ParseContent(contentObject);
                        
                        contents.Add(parsedContent);
                    }

                    var animal = new Animal(
                        animalName,
                        category!,
                        image,
                        url!,
                        contents.Select(MapToContentDto).ToList()
                    );

                    animals.Add(animal);
                }

                var overview = new AnimalOverview(
                    animals,
                    animals.Select(x => x.Category).Distinct().ToList()
                );

                overview = TransformOverview(overview);

                return overview;
            }
            catch (Exception ex)
            {
                _logger.LogError("Unable to get overview of animals. Exception: {Exception}", ex);

                return null;
            }
        });
        
        _cache.Remove("zoo_animals");

        return new(overview);
    }

    private static ContentDto MapToContentDto(IContent content)
    {
        return new(
            content.Value,
            content.Type,
            content.Children.Select(MapToContentDto).ToList()
        );
    }
    
    private static IContent GetContentValue(JsonElement content, string type, string propertyName = "text")
    {
        var text = content.GetProperty(propertyName).GetString();
        if (text is null) throw new NullReferenceException("No property found");

        return new Content(text, type);
    }

    private static AnimalName ParseAnimalName(JsonElement properties)
    {
        var displayName = properties.GetProperty("nonLatinName").GetString();
        var latinName = properties.GetProperty("latinName").GetString();
        var animalName = new AnimalName(displayName!, latinName!);
        
        return animalName;
    }

    private AnimalOverview TransformOverview(AnimalOverview overview)
    {
        overview = RemoveTitleFromContents(overview);
        
        return overview;
    }

    private static AnimalOverview RemoveTitleFromContents(AnimalOverview overview) 
        => overview with
        {
            Animals = overview.Animals
                .Select(animal => animal with
                {
                    Contents = animal.Contents.Skip(1).ToList()
                })
                .ToList()
        };
    
    // First part is just the title
    private IContent ParseContent(IContent content)
    {
        return content.Type switch
        {
            ContentType.Text or ContentType.HeadLine => ParseText(content),
            ContentType.Image => ParseText(content),
            ContentType.Header => ParseText(content),
            _ => throw new ArgumentOutOfRangeException(nameof(content), content, null)
        };
    }

    private IContent ParseText(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");
        
        var regex = new Regex(@"<(.+)>(.*)</(.+)>", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
        var isHtml = regex.IsMatch(str);
        if (!isHtml) return new Content(str, content.Type);

        return _htmlTransformer.Load(str).Parse();
    }
}