using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Options;
using Zeta.Inpark.Translator.Models;

namespace Zeta.Inpark.Translator.Services;

public class AzureTranslator : ITranslator
{
    private readonly AzureTranslatorOptions _options;

    public AzureTranslator(IOptions<AzureTranslatorOptions> options)
    {
        _options = options.Value;
    }

    public async Task<string> Translate(string to, string input)
    {
        var body = new object[] { new { Text = input } };
        var requestBody = JsonSerializer.Serialize(body, new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        });

        using var client = new HttpClient();
        using var request = new HttpRequestMessage();
        
        request.Method = HttpMethod.Post;
        request.RequestUri = new Uri(_options.Endpoint + $"/translate?api-version=3.0&to={to}");
        request.Content = new StringContent(requestBody, Encoding.UTF8, "application/json");
        request.Headers.Add("Ocp-Apim-Subscription-Key", _options.ResourceKey);
        request.Headers.Add("Ocp-Apim-Subscription-Region", _options.Region);

        var response = await client.SendAsync(request).ConfigureAwait(false);
        var result = await response.Content.ReadAsStringAsync();
        var deserializedOutput = JsonSerializer.Deserialize<TranslationResult[]>(result);
        var translationResult = deserializedOutput!
            .First(x => x.Translations.Any());
        var output = translationResult.Translations.First().Text;

        return output;
    }
}