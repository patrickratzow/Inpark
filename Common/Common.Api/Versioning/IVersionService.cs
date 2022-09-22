namespace Zeta.Common.Api.Versioning;

public interface IVersionService
{
    Version Version { get; }
    void SetVersion(string version);
}