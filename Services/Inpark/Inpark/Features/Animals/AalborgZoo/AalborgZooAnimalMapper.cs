using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Contracts;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.Animals.Interfaces;
using Zoo.Inpark.Models;
using Zoo.Inpark.Services;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.Animals.AalborgZoo;

public class AalborgZooAnimalMapper : IAnimalMapper
{
    private readonly IHtmlTransformer _htmlTransformer;
    private readonly ILogger<AalborgZooAnimalMapper> _logger;
    
    public AalborgZooAnimalMapper(IHtmlTransformer htmlTransformer, ILogger<AalborgZooAnimalMapper> logger)
    {
        _htmlTransformer = htmlTransformer;
        _logger = logger;
    }

    public Result<List<Animal>, string> ParseAnimalOverview(string input)
    { 
        try
        {
            using var json = JsonDocument.Parse(input);
            var items = json.RootElement.GetProperty("items");
            var animals = new List<Animal>();
            foreach (var itemJson in items.EnumerateArray())
            {
                var item = itemJson.GetProperty("item");
                var properties = item.GetProperty("properties");
                var url = item.GetProperty("url").GetString();
                var animalName = ParseAnimalName(properties);
                var category = properties.GetProperty("category").GetString();
                var content = item.GetProperty("content").ToString();
                var previewImage = properties.GetProperty("image")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");
                var fullscreenImage = properties.GetProperty("imageFullscreen")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");
                var baseUrl = "https://cms.aalborgzoo.dk";
                var image = AnimalImage.From(
                    $"{baseUrl}{previewImage}",
                    $"{baseUrl}{fullscreenImage}"
                );

                var animal = Animal.Create(
                    Guid.NewGuid(),
                    animalName!,
                    image,
                    category!, 
                    content
                );

                animals.Add(animal);
            }

            return animals;
        }
        catch (Exception ex)
        {
            _logger.LogError("Unable to get overview of animals. Exception: {Exception}", ex);

            return "Failed to map the content of the animal";
        }
    }

    public Result<List<IContent>, string> ParseContent(string content)
    {
        try
        {
            using var json = JsonDocument.Parse(content);
            var root = json.RootElement;

            var contents = new List<IContent>();
            foreach ( 
                var animalArrayContent in
                from itemContentJson in root.EnumerateArray()
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
                var parsedContent = TransformContent(contentObject);
                
                contents.Add(parsedContent);
            }
            
            return contents
                .SkipWhile(x => x.Type is ContentType.HeadLine)
                .ToList();
        }
        catch (Exception ex)
        {
            _logger.LogError("Exception occured while mapping. Exception: {Exception}", ex);

            return "Failed to map";
        }
    }
    
    private static IContent GetContentValue(JsonElement content, string type, string propertyName = "text")
    {
        var text = content.GetProperty(propertyName).GetString();
        if (text is null) throw new NullReferenceException("No property found");

        return new Content(text, type);
    }

    private static ContentDto MapToContentDto(IContent content)
    {
        return new(
            content.Value,
            content.Type,
            content.Children.Select(MapToContentDto).ToList()
        );
    }

    private static AnimalName ParseAnimalName(JsonElement properties)
    {
        var displayName = properties.GetProperty("nonLatinName").GetString();
        var latinName = properties.GetProperty("latinName").GetString();
        var animalName = AnimalName.From(displayName!, latinName!);
        
        return animalName;
    }
    
    private IContent TransformContent(IContent content)
    {
        return content.Type switch
        {
            ContentType.Text or ContentType.HeadLine => ParseText(content),
            ContentType.Image => ParseImage(content),
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
    
    private static IContent ParseImage(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");

        return new Content("https://cms.aalborgzoo.dk" + str, ContentType.Image);
    }
}