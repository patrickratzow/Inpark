using System.Text.Json;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.Speaks.Interfaces;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.Speaks.AalborgZoo;

public class AalborgZooSpeaksMapper : ISpeaksMapper
{
    private readonly ILogger<AalborgZooSpeaksMapper> _logger;

    public AalborgZooSpeaksMapper(ILogger<AalborgZooSpeaksMapper> logger)
    {
        _logger = logger;
    }
    
    public Result<List<Speak>, string> Parse(string input)
    {
        try
        {
            var speaks = new List<Speak>();
            var speakTimes = new List<SpeakTime>();
            using var json = JsonDocument.Parse(input);
            var items = json.RootElement.GetProperty("items");
            foreach (var itemObj in items.EnumerateArray())
            {
                var item = itemObj.GetProperty("item");
                var title = item.GetProperty("title").ToString();
                var properties = item.GetProperty("properties");
                var previewImage = properties.GetProperty("image")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");
                var fullscreenImage = properties.GetProperty("imageFullscreen")
                    .GetProperty("umbracoFile")
                    .GetProperty("src");
                var baseUrl = "https://cms.aalborgzoo.dk";
                var image = ImagePair.From(
                    $"{baseUrl}{previewImage}",
                    $"{baseUrl}{fullscreenImage}"
                );
                var times = properties.GetProperty("times").Deserialize<List<AalborgZooSpeakDto>>(new JsonSerializerOptions
                {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                });

                foreach (var speak in times!)
                {
                    var start = speak.Start;
                    var end = speak.End;
                    var timeRange = TimeRange.From(start, end);
                    var header = speak.Header;
                    var days = speak.WeekDays.ToHashSet();
                    var day = days.ToWeekDay();

                    speakTimes.Add(SpeakTime.From(header, day, timeRange));
                }                    
                
                speaks.Add(Speak.Create(Guid.NewGuid(), title, speakTimes, image));
                speakTimes.Clear();
            }
            
            return speaks;
        }
        catch (Exception ex)
        {
            _logger.LogError("Exception occured while mapping. Exception: {Exception}", ex);

            return "Failed to map";
        }
    }

    private class AalborgZooSpeakDto
      {
          public List<string> WeekDays { get; set; } = new();
          public DateTime Start { get; set; }
          public string Header { get; set; } = null!;
          public DateTime End { get; set; }
      }
}

