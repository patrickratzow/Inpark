using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Caching.Memory;

namespace Zeta.Inpark.Translator.Contracts;

public class TranslatorService : ITranslatorService
{
    private static readonly JsonSerializerOptions SerializerOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };
    private readonly IMemoryCache _cache;
    private readonly string _baseUrl;

    public TranslatorService(IMemoryCache cache, string baseUrl)
    {
        _cache = cache;
        _baseUrl = baseUrl;
    }

    public async ValueTask<T> Translate<T>(string to, T input, ICollection<string> properties)
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
            return cachedResponse;
        
        var response = await GetResponse<T>(json);
        _cache.Set(cacheKey, response);
        
        return response;
    }
    
    private async ValueTask<T> GetResponse<T>(string input)
    {
        var url = $"{_baseUrl}/translate-object";
        using var client = new HttpClient();

        var content = new StringContent(input, Encoding.UTF8, "application/json");
        var response = await client.PostAsync(url, content);
        response.EnsureSuccessStatusCode();
        
        var responseBody = await response.Content.ReadAsStringAsync();
        var body = JsonSerializer.Deserialize<T>(responseBody, SerializerOptions);
        if (body is null)
            throw new NullReferenceException("Response body is null");

        return body;
    }
}