using Azure.Monitor.OpenTelemetry.Exporter;
using OpenTelemetry.Trace;
using Zoo.Payments;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddPayments(builder.Configuration);

if (builder.Configuration["Azure:Insights:Enabled"] is "true")
{
    builder.Services.AddOpenTelemetryTracing(b =>
    {
        b.AddAzureMonitorTraceExporter(o =>
        {
            o.ConnectionString = builder.Configuration["Azure:Insights:ConnectionString"];
        });
        b.AddAspNetCoreInstrumentation();
    });
}

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UsePayments();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();