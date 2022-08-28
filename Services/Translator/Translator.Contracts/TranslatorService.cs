using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using Microsoft.Extensions.Caching.Memory;

namespace Zeta.Inpark.Translator.Contracts;

public class TranslatorService : ITranslatorService
{
    private readonly IMemoryCache _cache;
    private readonly string _baseUrl;

    public TranslatorService(IMemoryCache cache, string baseUrl)
    {
        _cache = cache;
        _baseUrl = baseUrl;
    }

    private readonly Regex _zTranslateRegex = new(@"z-translate\((.*)\)", RegexOptions.Compiled | RegexOptions.IgnoreCase);
    public async ValueTask<string> TranslateSdui(string to, string text)
    {
        var regexMatches = _zTranslateRegex.Matches(text);
        if (regexMatches.Count <= 0) return text;
        
        foreach (Match match in regexMatches)
        {
            var obj = new
            {
                Text = match.Groups[1].Value
            };
            var translation = await Translate(to, obj, new List<string>()
            {
                "Text"
            });
                    
            text = text.Replace("z-translate(" + obj.Text + ")", translation.Text);
        }

        return text;
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
        var body = JsonSerializer.Deserialize<T>(responseBody);
        if (body is null)
            throw new NullReferenceException("Response body is null");

        return body;
    }
}