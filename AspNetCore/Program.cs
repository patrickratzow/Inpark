using System.Reflection;
using Azure.Monitor.OpenTelemetry.Exporter;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.OpenApi.Models;
using OpenTelemetry.Trace;
using Zoo.Common.Api;
using Zoo.Common.Api.Extensions;
using Zoo.Inpark;
using Zoo.Payments;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddPayments(builder.Configuration);
builder.Services.AddInpark(builder.Configuration);

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
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new()
    {
        Version = "v1",
        Title = "Zooinator - API",
        Description = "API for Zooinator"
    });
    options.AddSecurityDefinition("bearer", new()
    {
        Type = SecuritySchemeType.Http,
        BearerFormat = "Token",
        In = ParameterLocation.Header,
        Scheme = "bearer"
    });
    options.TagActionsBy(apiDescription =>
    {
        var actionDescriptor = (ControllerActionDescriptor)apiDescription.ActionDescriptor;
        var controller = actionDescriptor.ControllerTypeInfo;
        var groupAttribute = controller.GetCustomAttribute<MethodGroupAttribute>();
        if (groupAttribute is null) return new List<string>();

        return new List<string>
        {
            groupAttribute.Name
        };
    });
    options.CustomOperationIds(operation =>
    {
        if (operation.ActionDescriptor is not ControllerActionDescriptor controllerActionDescriptor)
            throw new InvalidOperationException("ActionDescriptor does not originate from a controller");

        var name = controllerActionDescriptor.ActionName;

        return $"{name[..1].ToLower()}{name[1..]}";
    });
        
    options.UseZooOptions();

    // using System.Reflection;
    // var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    // options.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseFluentValidationExceptionHandler();

app.UsePayments();
app.UseInpark();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();