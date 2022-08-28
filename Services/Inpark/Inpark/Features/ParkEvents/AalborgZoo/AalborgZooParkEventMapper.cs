using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Common.SDUI;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Features.ParkEvents.Interfaces;
using Zeta.Inpark.Models;
using Zeta.Inpark.Services;
using Zeta.Inpark.ValueObjects;
using Container = Zeta.Inpark.Common.SDUI.Container;

namespace Zeta.Inpark.Features.ParkEvents.AalborgZoo;

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

    public Result<SDUINode, string> ParseContent(string content)
    {
        try
        {
            using var json = JsonDocument.Parse(content);
            var root = json.RootElement;

            var rootNode = new Container();
            var navbar = new Navbar();
            navbar.SetParent(rootNode);
            
            // Add tabs
            var descriptionTab = new Navtab("Information", "menu");
            navbar.AddTab(descriptionTab);

            var tabsJson = root.EnumerateArray().ToList();
            var informationTabs = tabsJson
                .Where(x =>
                    !x.EnumerateArray().Any(y =>
                        y.GetProperty("type").ToString() == "header" &&
                        y.GetProperty("header").ToString() == "Program")
                );
            
            var column = new SDUINode("Column");
            foreach (var item in informationTabs)
            {
                var tabContent = ParseTab(item);
                tabContent.SetParent(column);
            }
            descriptionTab.AddChild(column);

            var programTabJson = tabsJson.FirstOrDefault(x =>
                x.EnumerateArray().Any(y =>
                    y.GetProperty("type").ToString() == "header" && 
                    y.GetProperty("header").ToString() == "Program")
            );
            if (programTabJson.ValueKind is not JsonValueKind.Undefined)
            {
                var programTab = new Navtab("Program", "menu");
                var programContent = ParseTab(programTabJson);
                programContent.SetParent(programTab);
                navbar.AddTab(programTab);
            }

            return rootNode;
        }
        catch (Exception ex)
        {
            _logger.LogError("Exception occured while mapping. Exception: {Exception}", ex);

            return "Failed to map";
        }
    }

    private SDUINode ParseTab(JsonElement item)
    {
        var padding = new SDUINode("Padding");
        padding.SetAttribute("all", "8");
        
        var column = new SDUINode("Column");
        column.SetAttribute("cross-axis-alignment", "start");
        padding.AddChild(column);

        // Skip first as it is the title of the tab
        var items = item.EnumerateArray().Skip(1);
        foreach (var park in items)
        {
            var type = park.GetProperty("type").GetString();
            var node = type switch
            {
                "text" or "headline" => CreateText(park),
                "header" => CreateHeader(park),
                "image" => CreateImage(park),
                "callToAction" => CreateLink(park),
                _ => null
                //_ => throw new ArgumentOutOfRangeException(nameof(type), type, "Unknown event type")
            };
            if (node is null)
            {
                _logger.LogWarning("Unknown event type: {Type}", type);

                continue;
            }

            column.AddChild(node);
        }

        return padding;
    }

    private static SDUINode CreateLink(JsonElement json)
    {
        var url = json.GetProperty("externalPage").ToString();
        var linkText = json.GetProperty("linkButtonText").ToString();

        var buttonAction = new OpenUrlAction(url);
        var button = new Button(buttonAction);
        
        var text = new Text(linkText);
        button.AddChild(text);

        return button;
    }
    
    private static SDUINode CreateImage(JsonElement json)
    {
        var alt = json.GetProperty("alt").ToString();
        var url = json.GetProperty("image").ToString();
        var imageUrl = "https://cms.aalborgzoo.dk" + url;
        
        var gestureDetector = new GestureDetector();
        gestureDetector.OnTap(new FullscreenImageAction(
            new(
                imageUrl,
                imageUrl,
                "Fullscreen",
                imageUrl,
                true
            )
        ));

        var card = new Card();
        card.SetParent(gestureDetector);
        card.SetBorderRadius(BorderRadius.Circular(6));
        card.SetClip(Clip.AntiAlias);

        var image = new Image(imageUrl, alt);
        image.SetParent(card);

        return gestureDetector;
    }

    private static SDUINode CreateHeader(JsonElement json)
    {
        var headerText = json.GetProperty("header").ToString();

        var padding = new Padding(EdgeInsets.Top(8));

        var text = new Text(headerText);
        text.SetParent(padding);
        text.SetStyle(TextStyle.HeadlineLarge);
        
        return padding;
    }
    
    private SDUINode CreateText(JsonElement json)
    {
        var jsonText = json.GetProperty("text").ToString();
        var regex = new Regex(@"<(.+)>(.*)</(.+)>", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
        var isHtml = regex.IsMatch(jsonText);
        if (!isHtml)
        {
            var node = new Text(jsonText);
            node.SetStyle(TextStyle.BodyMedium);

            return node;
        }
        
        var wrapper = _htmlTransformer.ParseToSDUI(jsonText);
        wrapper.SetDebug("HTML Segment wrapper");
        
        return wrapper;
    }

    private IContent ParseText(IContent content)
    {
        if (content.Value is not string str) throw new InvalidOperationException($"Value must be a string");

        var regex = new Regex(@"<(.+)>(.*)</(.+)>", RegexOptions.Compiled | RegexOptions.IgnoreCase | RegexOptions.Multiline);
        var isHtml = regex.IsMatch(str);
        if (!isHtml) return new Content(str, content.Type);

        return _htmlTransformer.Load(str.Replace("&amp;", "&")).Parse();
    }

 

    private class EventTime
    {
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
    }
}

