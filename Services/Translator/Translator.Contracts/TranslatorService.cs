using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Logging;

namespace Zeta.Inpark.Translator.Contracts;

public class TranslatorService : ITranslatorService
{
    private readonly ILogger<TranslatorService> _logger;
    private readonly IMemoryCache _cache;
    private readonly string _baseUrl;

    public TranslatorService(ILogger<TranslatorService> logger, IMemoryCache cache, string baseUrl)
    {
        _logger = logger;
        _cache = cache;
        _baseUrl = baseUrl;
    }

    public async ValueTask<string> Translate(string to, string text)
    {
        var obj = new
        {
            Text = text
        };
        var result = await TranslateObject(to, obj, new List<string>
        {
            "Text"
        });

        return result.Text;
    }

    public async ValueTask<T> TranslateObject<T>(string to, T input, ICollection<string> properties)
    {
        var obj = new
        {
            To = to,
            Input = input,
            Properties = properties
        };
        var json = JsonSerializer.Serialize(obj);
        
        var typeName = typeof(T).Name.ToLower();
        var cacheKey = $"{typeName}-{to}-{json}";
        if (_cache.TryGetValue(cacheKey, out T cachedResponse))
        {
            _logger.LogInformation("Found {TranslatorKey} in cache while trying to translate", $"{typeName}-{to}");

            return cachedResponse;
        }

        _logger.LogInformation("No {TranslatorKey} found in cache", $"{typeName}-{to}");
        var response = await GetResponse<T>(json, $"{typeName}-{to}");
        _cache.Set(cacheKey, response);
        _logger.LogInformation("Got {TranslatorKey} from Translator, saved in cache", $"{typeName}-{to}");

        return response;
    }
    
    private async ValueTask<T> GetResponse<T>(string input, string translatorKey)
    {
        var url = $"{_baseUrl}/translate-object";
        using var client = new HttpClient();

        _logger.LogInformation("Requesting {TranslatorKey} from Translator, URL: {url}", translatorKey, url);

        var content = new StringContent(input, Encoding.UTF8, "application/json");
        var response = await client.PostAsync(url, content);
        response.EnsureSuccessStatusCode();
        
        var responseBody = await response.Content.ReadAsStringAsync();
        var body = JsonSerializer.Deserialize<T>(responseBody);
        if (body is null)
            throw new NullReferenceException("Response body is null");

        return body;
    }
}