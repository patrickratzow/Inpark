namespace Zoo.Common.Api.Versioning;

public class VersionNotSupportedException : Exception
{
    public string Version { get; }
    
    public VersionNotSupportedException(string version)
    {
        Version = version;
    }
}