using System.Reflection;
using MediatR;

namespace Zeta.Common.Api.Versioning;

public class VersioningPipeline<TRequest, TResponse> : IPipelineBehavior<TRequest, TResponse>
    where TRequest : IRequest<TResponse>
{
    private IVersionService _versionService;

    public VersioningPipeline(IVersionService versionService)
    {
        _versionService = versionService;
    }
    
    public Task<TResponse> Handle(TRequest request, CancellationToken cancellationToken,
        RequestHandlerDelegate<TResponse> next)
    {
        var version = _versionService.Version;
        var requestVersions = typeof(TRequest).GetCustomAttributes<VersionAttribute>().ToList();
        if (requestVersions.Any())
        {
            var requestVersion = requestVersions.FirstOrDefault(v => v.Version == version.ToString());
            if (requestVersion == null)
            {
                throw new VersionNotSupportedException(version.ToString());
            }

            return next();
        }
        else
        {
            return next();
        }
    }
}