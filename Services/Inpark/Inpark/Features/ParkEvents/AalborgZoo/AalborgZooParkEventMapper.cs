using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Features.Events.Interfaces;
using Zoo.Inpark.Models;
using Zoo.Inpark.Services;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.Events.AalborgZoo;

public class AalborgZooParkEventMapper : IParkEventMapper
{

    private readonly IHtmlTransformer _htmlTransformer;
    private readonly ILogger<AalborgZooParkEventMapper> _logger;

    public AalborgZooParkEventMapper(IHtmlTransformer htmlTransformer, ILogger<AalborgZooParkEventMapper> logger)
    {
        _htmlTransformer = htmlTransformer;
        _logger = logger;
    }

    public Result<List<ParkEvent>, string> ParseParkEvent(string input)
    {
        try
        {
            using var json = JsonDocument.Parse(input);
            var items = json.RootElement.GetProperty("items");
            var parkEvents = new List<ParkEvent>();
            foreach (var itemJson in items.EnumerateArray())
            {
                var baseUrl = "https://cms.aalborgzoo.dk";
                var item = itemJson.GetProperty("item");
                var properties = item.GetProperty("properties");
                var previewImage = properties.GetProperty("image")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");
                var fullscreenImage = properties.GetProperty("imageFullscreen")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");

                var times = properties.GetProperty("times").Deserialize<List<EventTime>>(new JsonSerializerOptions
                {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                });

                var image = ImagePair.From(
                   $"{baseUrl}{previewImage}",
                   $"{baseUrl}{fullscreenImage}"
               );

                var title = item.GetProperty("content")[0].GetProperty("content")[0][0].GetProperty("text").ToString();
                var range = TimeRange.From(times[0].Start, times[0].End); // Time is an array, but all examples have just one element?
                var description = item.GetProperty("properties");
                var content = item.GetProperty("content")[1].GetProperty("content").ToString();

                var parkEvent = ParkEvent.Create(
                    Guid.NewGuid(),
                    image!,
                    title,
                    range!,
                    content
                );

                parkEvents.Add(parkEvent);
            }

            return parkEvents;
        }
        catch (Exception ex)
        {
            _logger.LogError("Unable to get overview of park events. Exception: {Exception}", ex);

            return "Failed to map the content of the park event";
        }
    }

    public Result<List<IContent>, string> ParseContent(string content)
    {
        try
        {
            using var json = JsonDocument.Parse(content);
            var root = json.RootElement;

            var contents = new List<IContent>();
            // What we want: additional images, descriptions of the event and a program for the event.
            foreach (var item in root.EnumerateArray())
            {
                var parkEventContent = item.EnumerateArray();
                foreach (var park in item.EnumerateArray())
                {
                    var type = park.GetProperty("type").GetString();
                    var contentObject = type switch
                    {
                        "text" or "headline" => GetContentValue(park, type),
                        "header" => GetContentValue(park, type, "header"),
                        "image" => GetContentValue(park, type, "image"),
                        "callToAction" => GetContentValue(park, type, "externalPage"),
                        _ => throw new ArgumentOutOfRangeException(nameof(type), type, "Unknown event type")
                    };
                    var parsedContent = TransformContent(contentObject);

                    contents.Add(parsedContent);
                }
            }
            return contents;
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
    private IContent TransformContent(IContent content)
    {
        return content.Type switch
        {
            ContentType.Text or ContentType.HeadLine => ParseText(content),
            ContentType.Image => ParseImage(content),
            ContentType.Header => ParseText(content),
            ContentType.CallToAction => ParseCallToAction(content),
            _ => throw new ArgumentOutOfRangeException(nameof(content), content, null)
        };
    }

    private IContent ParseText(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");

        var regex = new Regex(@"<(.+)>(.*)</(.+)>", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
        var isHtml = regex.IsMatch(str);
        if (!isHtml) return new Content(str, content.Type);

        return _htmlTransformer.Load(str.Replace("&amp;", "&")).Parse();
    }

    private static IContent ParseImage(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");

        return new Content("https://cms.aalborgzoo.dk" + str, ContentType.Image);
    }

    private static IContent ParseCallToAction(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");

        return new Content(str, ContentType.CallToAction);
    }

    private class EventTime
    {
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
    }
}

