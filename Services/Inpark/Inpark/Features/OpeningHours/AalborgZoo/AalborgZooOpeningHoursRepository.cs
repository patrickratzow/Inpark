using System.Net;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Zeta.Inpark.Entities;
using Zeta.Inpark.Enums;
using Zeta.Inpark.Features.OpeningHours.Interfaces;
using Zeta.Inpark.ValueObjects;

namespace Zeta.Inpark.Features.OpeningHours.AalborgZoo;

public class AalborgZooOpeningHoursRepository : IOpeningHoursRepository
{
    private readonly HttpClient _client;
    private readonly ILogger<AalborgZooOpeningHoursRepository> _logger;
    private readonly InparkDbContext _context;
    
    public AalborgZooOpeningHoursRepository(HttpClient client, ILogger<AalborgZooOpeningHoursRepository> logger, 
        InparkDbContext context)
    {
        _client = client;
        _logger = logger;
        _context = context;
    }

    public async ValueTask<Result<string, string>> GetRange(TimeRange range)
    {
        _logger.BeginScope("Aalborg Zoo - Opening Hours. Range {Range}", range);
        
        try
        {
            _logger.LogInformation("Getting opening hours");
            
            var request = BuildRequest(range);
            var response = await _client.PostAsync("Content/GetElementsBySearch", request);

            _logger.LogInformation("Got opening hours. Response status code: {StatusCode}", 
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
                "Exception occured while getting open hours for Aalborg Zoo. Exception: {Exception}", ex);
            
            return Result<string, string>.Error(ex.ToString());
        }
    }

    public async ValueTask<List<OpeningHour>> GetDate(DateOnly date)
    {
        var dateTime = date.ToDateTime(TimeOnly.MinValue);
        var value = (int)Enum.Parse(typeof(WeekDay), date.DayOfWeek.ToString());
        var openingHours = await _context.OpeningHours
            .AsNoTracking()
            .Where(x => 
                x.Range.Start.Date <= dateTime.Date && 
                x.Range.End.Date >= dateTime.Date && 
                ((int)x.Days & value) != 0
            )
            .OrderByDescending(x => x.Range.Start)
            .ToListAsync();

        // Group together opening hours that are on the same day
        openingHours = openingHours
            .ToLookup(x => x.Range.Start.TimeOfDay)
            .Select(start => start.MaxBy(x => x.Range.End.TimeOfDay))
            .Where(x => x is not null)
            .Cast<OpeningHour>()
            .ToList();
        
        // Populate the fields
        await AddColors(openingHours);

        return openingHours;
    }

    public async ValueTask<List<OpeningHour>> GetAll()
    {
        var openingHours = await _context.OpeningHours
            .AsNoTracking()
            .OrderByDescending(x => x.Range.Start)
            .ToListAsync();
        
        // Populate the fields
        await AddColors(openingHours);
        
        return openingHours;
    }

    private async ValueTask<Dictionary<string, string>> GetColors()
    {
        var hourRanges = await _context.HourRanges.ToListAsync();
            
        return hourRanges
            .Select(x => new
            {
                Start = x.Start.ToString("HH\\:mm"),
                End = x.End.ToString("HH\\:mm"),
                x.Color,
            })
            .DistinctBy(x => $"${x.Start}-${x.End}")
            .ToDictionary(x => $"{x.Start}-{x.End}", x => x.Color);
    }

    private async ValueTask AddColors(List<OpeningHour> openingHours)
    {
        var colors = await GetColors();
        
        foreach (var openingHour in openingHours)
        {
            var hourRange = $"{openingHour.Range.Start:HH\\:mm}-{openingHour.Range.End:HH\\:mm}";
            if (!colors.TryGetValue(hourRange, out var color)) continue;

            openingHour.SetField("color", color!);
        }
    }

    private static HttpContent BuildRequest(TimeRange range)
    {
        var start = range.Start.ToString("yyyy-MM-dd");
        var end = range.End.ToString("yyyy-MM-dd");
        var body = $"{{\"area\":{{\"areaId\":\"marketing\",\"languageCode\":\"da-DK\",\"currencyCode\":\"DKK\"}},\"facets\":[],\"skip\":0,\"take\":1000,\"search\":{{\"type\":\"and\",\"queries\":[{{\"type\":\"and\",\"weighted\":false,\"queries\":[{{\"type\":\"range\",\"field\":\"data.properties.times.start\",\"gte\":\"{start}\"}},{{\"type\":\"range\",\"field\":\"data.properties.times.end\",\"lte\":\"{end}\"}}]}}],\"weighted\":false}},\"lookupTemplate\":\"openinghour\",\"sorting\":[]}}";

        var content = new StringContent(body);
        content.Headers.ContentType = new("application/json");
        
        return content;
    }
}