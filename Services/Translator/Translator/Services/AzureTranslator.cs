using System.Text;
using System.Text.Json;
using System.Security.Cryptography;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using StackExchange.Redis;
using Zeta.Inpark.Translator.Models;

namespace Zeta.Inpark.Translator.Services;

public class AzureTranslator : ITranslator
{
    private readonly AzureTranslatorOptions _options;
    private readonly IConnectionMultiplexer _cache;
    private readonly ILogger<AzureTranslator> _logger;

    public AzureTranslator(
        IOptions<AzureTranslatorOptions> options, 
        IConnectionMultiplexer cache, 
        ILogger<AzureTranslator> logger)
    {
        _cache = cache;
        _logger = logger;
        _options = options.Value;
    }

    public async Task<string> TranslateText(string to, string input)
    {
        var inputKey = Hash(input);
        var cacheKey = $"translation:text:{to}-{inputKey}";
        var db = _cache.GetDatabase();
        var cached = await db.StringGetAsync(cacheKey);
        if (cached.HasValue)
            return cached.ToString();
        
        var body = new object[] { new { Text = input } };
        var requestBody = JsonSerializer.Serialize(body);

        using var client = new HttpClient();
        using var request = new HttpRequestMessage();
        
        request.Method = HttpMethod.Post;
        request.RequestUri = new Uri(_options.Endpoint + $"/translate?api-version=3.0&to={to}&textType=html");
        request.Content = new StringContent(requestBody, Encoding.UTF8, "application/json");
        request.Headers.Add("Ocp-Apim-Subscription-Key", _options.ResourceKey);
        request.Headers.Add("Ocp-Apim-Subscription-Region", _options.Region);

        var response = await client.SendAsync(request).ConfigureAwait(false);
        var result = await response.Content.ReadAsStringAsync();
        try
        {
            var deserializedOutput = JsonSerializer.Deserialize<TranslationResult[]>(result, new JsonSerializerOptions
            {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            });
            var translationResult = deserializedOutput!
                .First(x => x.Translations.Any());
            var output = translationResult.Translations.First().Text;

            await db.StringSetAsync(cacheKey, output, TimeSpan.FromHours(12));
            
            return output;
        }
        catch (Exception ex)
        {
            _logger.LogError("Was unable to parse the result {Result}. Exception: {Exception}", result, ex);
            
            throw;
        }
    }

    private static string Hash(string input)
    {
        using var md5 = MD5.Create();
        
        md5.Initialize();
        md5.ComputeHash(Encoding.UTF8.GetBytes(input));

        return Convert.ToBase64String(md5.Hash!);
    }
}