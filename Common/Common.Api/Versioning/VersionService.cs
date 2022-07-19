namespace Zoo.Common.Api.Versioning;

public class VersionService : IVersionService
{
    private Version? _version;
    public Version Version => _version ?? new(1, 0, 0);

    public void SetVersion(string version)
    {
        var parts = version.Split(".");
        if (parts.Length <= 2)
        {
            _version = new(1, 0, 0);

            return;
        }

        try
        {
            var major = int.Parse(parts[0]);
            var minor = int.Parse(parts[1]);
            var lastPart = parts[2].Split("+");
            var patch = int.Parse(lastPart[0]);
            var hasBuildNumber = lastPart.Length != 1;
            var buildNumber = hasBuildNumber ? int.Parse(lastPart.Last()) : (int?)null;

            _version = new(major, minor, patch, buildNumber);
        }
        catch
        {
            _version = new(1, 0, 0);
        }
    }
}