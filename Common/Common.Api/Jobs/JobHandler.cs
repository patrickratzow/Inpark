using System.Reflection;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace Zeta.Common.Api.Jobs;

public class JobHandler
{
    private readonly IServiceProvider _serviceProvider;
    private readonly ILogger<JobHandler> _logger;
    private readonly IMediator _mediator;

    public JobHandler(IServiceProvider serviceProvider, ILogger<JobHandler> logger, IMediator mediator)
    {
        _serviceProvider = serviceProvider;
        _logger = logger;
        _mediator = mediator;
    }

    public async Task ExecuteJob(string jobId)
    {
        _logger.LogInformation("Got a job with job id {JobId}", jobId);
        var job = _findJob(jobId);
        if (job is null) return;

        _logger.LogInformation("Executing job {JobId}", jobId);

        await job;
    }

    private Task? _findJob(string jobId)
    {
        var assemblies = AppDomain.CurrentDomain.GetAssemblies();
        var job = assemblies.SelectMany(a => a.GetTypes())
            // Has attribute JobAttribute and jobId matches job attribute value
            .Where(t => t.GetCustomAttribute<JobAttribute>()?.Id == jobId)
            // Create via DI container
            .Select(t => _serviceProvider.GetRequiredService(t))
            .FirstOrDefault();
        if (job is null) return null;
        
        return _mediator.Send(job);
    }
}