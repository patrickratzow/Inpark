namespace Zeta.UI.Mappers.Umbraco;

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
        
        var uri = new Uri(url);
        var isAbsolute = uri.IsAbsoluteUri;
        if (isAbsolute) return uri.AbsolutePath;
        
        var combinedUri = new Uri(Path.Combine(_config.BaseUrl, url));

        return combinedUri.AbsolutePath;
    }
}