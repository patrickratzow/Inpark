using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Zeta.Common.Functions;

var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .Build();

host.Run();