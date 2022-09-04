using System.Text.Json;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.OpeningHours.Interfaces;
using Zeta.Inpark.ValueObjects;
using Zoo.Inpark.Contracts;

namespace Zeta.Inpark.Features.OpeningHours.AalborgZoo;

public class AalborgZooOpeningHoursMapper : IOpeningHoursMapper
{
    private readonly ILogger<AalborgZooOpeningHoursMapper> _logger;
    

    public AalborgZooOpeningHoursMapper(ILogger<AalborgZooOpeningHoursMapper> logger)
    {
        _logger = logger;
    }

    public ValueTask<Result<List<OpeningHour>, string>> Parse(string input)
    {
        try
        {
            var openingHours = new List<OpeningHour>();
            using var json = JsonDocument.Parse(input);
            var items = json.RootElement.GetProperty("items");
            foreach (var itemObj in items.EnumerateArray())
            {
                var item = itemObj.GetProperty("item");
                var properties = item.GetProperty("properties");
                var times = properties.GetProperty("times").Deserialize<List<OpeningTime>>(new JsonSerializerOptions
                {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                });;

                foreach (var time in times!)
                {
                    var start = time.Start;
                    var end = time.End;
                    var timeRange = TimeRange.From(start, end);
                    var open = time.OpenClosed is "open";
                    var header = time.Header.Replace("Aalborg Zoo -", "").Trim();
                    var days = time.WeekDays.ToHashSet();
                    var day = days.ToWeekDay();
                    
                    var openingHour = OpeningHour.Create(Guid.NewGuid(), header, timeRange, day, open, new());
                    
                    openingHours.Add(openingHour);
                }
            }

            return new(openingHours);
        }
        catch (Exception ex)
        {
            _logger.LogError("Exception occured while mapping. Exception: {Exception}", ex);

            return new("Failed to map");
        }
    }

    public OpeningHourDto MapToDto(OpeningHour openingHour)
    {
        return new(
            openingHour.Name,
            openingHour.Range.Start,
            openingHour.Range.End,
            openingHour.Open,
            openingHour.Days.ToDays(),
            openingHour.Fields.ToDictionary(x => x.Key, x => x.Value)
        );
    }

    private class OpeningTime
    {
        public bool Special { get; set; }
        public string OpenClosed { get; set; } = null!;
        public List<string> WeekDays { get; set; } = new();
        public DateTime Start { get; set; }
        public string Header { get; set; } = null!;
        public DateTime End { get; set; }
    }
}