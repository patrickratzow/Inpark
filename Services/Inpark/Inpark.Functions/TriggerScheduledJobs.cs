using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Security;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Extensions.Logging;

namespace Zeta.Inpark.Functions;

public class TriggerScheduledJobs
{
    private readonly List<string> _jobs = new()
    {
        "jobs/animals/fetch"
    };

    [FunctionName("TriggerScheduledJobs")]
    public async Task Run(
        [TimerTrigger("0 0 3 * * *")] TimerInfo myTimer,
        ILogger log)
    {
        var baseUrl = Environment.GetEnvironmentVariable("SCHEDULED_JOBS_BASE_URL");
        log.LogInformation($"Executing {nameof(TriggerScheduledJobs)} at {DateTime.Now}");

        var tasks = new List<Task>();
        using var httpClient = new HttpClient();
        foreach (var job in _jobs)
        {
            var url = $"{baseUrl}/{job}";
            var body = new { };
            var request = httpClient.PostAsJsonAsync(url, body);

            log.LogInformation($"Adding request to {url} to queue");

            tasks.Add(request);
        }

        log.LogInformation("Triggering jobs");

        await Task.WhenAll(tasks);

        log.LogInformation("Finished triggering jobs");
    }

}
