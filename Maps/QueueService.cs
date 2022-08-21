using System.Text.Json;
using Azure.Storage.Queues;
using Microsoft.Extensions.Configuration;

namespace Zeta.Inpark.Maps;

public class QueueService
{
    private readonly string _connectionString;

    public QueueService(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("Queue");
    }

    public async Task Send<T>(string queueName, T obj)
    {
        var json = JsonSerializer.Serialize(obj, new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        });
        var queueClient = new QueueClient(_connectionString, queueName, new()
        {
            MessageEncoding = QueueMessageEncoding.Base64
        });
        
        await queueClient.CreateIfNotExistsAsync();
        
        var exists = await queueClient.ExistsAsync();
        if (!exists) return;
       
        await queueClient.SendMessageAsync(json);
    }
}