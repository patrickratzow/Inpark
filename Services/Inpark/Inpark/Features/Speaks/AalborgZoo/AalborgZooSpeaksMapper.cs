using System.Text.Json;
using Microsoft.Extensions.Logging;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Enums;
using Zoo.Inpark.Extensions;
using Zoo.Inpark.Features.Speaks.Interfaces;
using Zoo.Inpark.ValueObjects;

namespace Zoo.Inpark.Features.Speaks.AalborgZoo;

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
                var times = properties.GetProperty("times").Deserialize<List<SpeakDto>>(new JsonSerializerOptions
                {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                });

                foreach (var speak in times!)
                {
                    var timeZone = TimeZoneInfo.FindSystemTimeZoneById("Europe/Copenhagen");
                    var start = speak.Start.ToTimeZoneOffset(timeZone);
                    var end = speak.End.ToTimeZoneOffset(timeZone);
                    var timeRange = TimeRange.From(start, end);
                    var header = speak.Header;
                    var days = speak.WeekDays.ToHashSet();
                    var day = days.ToWeekDay();

                    speakTimes.Add(SpeakTime.From(header, day, timeRange));
                }                    
                
                speaks.Add(Speak.Create(Guid.NewGuid(), title, speakTimes));
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

    private class SpeakDto
      {
          public List<string> WeekDays { get; set; } = new();
          public DateTimeOffset Start { get; set; }
          public string Header { get; set; } = null!;
          public DateTimeOffset End { get; set; }
      }
}

