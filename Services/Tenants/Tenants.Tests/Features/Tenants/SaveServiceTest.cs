using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DomainFixture;
using FluentAssertions;
using NUnit.Framework;
using Zeta.Inpark.Tenants.Entities;
using Zeta.Inpark.Tenants.Errors;
using Zeta.Inpark.Tenants.Features;

namespace Zeta.Inpark.Tenants.Tests.Features.Tenants;

[TestFixture]
[Category(Categories.Integration)]
public class SaveServiceTest : TestBase
{
    [Test]
    public async Task Handle_ShouldReturnTenantNotFound_WhenNoTenantIsFound()
    {
        //Arrange
        var featureList = new List<SaveService.ServiceFeature>();
        var command = new SaveService.Command("qeqeqe", Guid.NewGuid(), featureList);

        //Act
        var response = await Send(command);
        
        //Assert
        response.Value.Should().BeOfType<TenantNotFound>();
    }

    [Test]
    public async Task Handle_ShouldReturnCreatedService_WhenServiceDoesNotExist()
    {
        //Arrange
        var tenant = await Add(Fixture.Valid<Tenant>().Create());
        var serviceFeature = new SaveService.ServiceFeature("animal", "data for animals!");
        var command = new SaveService.Command("inpark", tenant.Id, new() { serviceFeature });

        //Act
        var response = await Send(command);

        //Assert
        response.Value.Should().BeOfType<SaveService.Response>();
        var result = response.Value.As<SaveService.Response>();
        result.ServiceId.Should().Be(command.ServiceId);
        var count = await Count<Service>();
        count.Should().Be(1);
    }
    
    [Test]
    public async Task Handle_ShouldReturnCreatedFeature_WhenFeatureDoesNotExist()
    {
        //Arrange
        var service = Fixture.Valid<Service>()
            .WithMany(x => x.Features, 1)
            .Create();
        var tenant = await Add(
            Fixture.Valid<Tenant>()
                .With(x => x.Services, new List<Service>() { service })
                .Create()
        );
        var serviceFeatures = service.Features
                .Select(x => new SaveService.ServiceFeature(x.FeatureId, x.Data))
                .ToList();
        serviceFeatures.Add(new("animal", "data for animal!"));

        var command = new SaveService.Command(
            service.ServiceId,
            tenant.Id,
            serviceFeatures
        );

        //Act
        var response = await Send(command);

        //Assert
        response.Value.Should().BeOfType<SaveService.Response>();
        var result = response.Value.As<SaveService.Response>();
        result.ServiceId.Should().BeNull();
        var count = await Count<Feature>();
        count.Should().Be(serviceFeatures.Count);
    }
    
    [Test]
    public async Task Handle_ShouldReturnUpdatedFeature_WhenFeatureAlreadyExist()
    {
        //Arrange
        var service = Fixture.Valid<Service>()
            .WithMany(x => x.Features, 1)
            .Create();
        var tenant = await Add(
            Fixture.Valid<Tenant>()
                .With(x => x.Services, new List<Service>() { service })
                .Create()
        );
        var serviceFeature = new SaveService.ServiceFeature(
            service.Features.First().FeatureId,
            service.Features.First().Data + "omegalul"
        );

        var command = new SaveService.Command(
            service.ServiceId,
            tenant.Id,
            new() { serviceFeature }
        );

        //Act
        var response = await Send(command);

        //Assert
        response.Value.Should().BeOfType<SaveService.Response>();
        var result = response.Value.As<SaveService.Response>();
        result.ServiceId.Should().BeNull();
        var dbFeature = await Find<Feature>(service.Features.First().Id);
        dbFeature.Should().NotBeNull();
        dbFeature!.Data.Should().Be(serviceFeature.Data);
    }
}

