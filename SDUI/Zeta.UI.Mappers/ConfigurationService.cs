namespace Zeta.UI.Mappers;

public class ConfigurationService
{
    private readonly FeatureConfig _config;

    public ConfigurationService(FeatureConfig config)
    {
        _config = config;
    }

    public string JoinUrl(string url)
    {
        if (_config.BaseUrl is null) return url;

        try
        {
            var uri = new Uri(url);
            var isAbsolute = uri.IsAbsoluteUri;
            if (isAbsolute) return uri.AbsoluteUri;

            var combinedUri = new Uri(Path.Join(_config.BaseUrl, url));

            return combinedUri.AbsoluteUri;
        }
        catch (UriFormatException)
        {
            var path = Path.Join(_config.BaseUrl, url);
            var combinedUri = new Uri(path);

            return combinedUri.AbsoluteUri;
        }
    }
}