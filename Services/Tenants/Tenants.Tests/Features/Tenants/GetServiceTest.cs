using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DomainFixture;
using FluentAssertions;
using NUnit.Framework;
using Zeta.Inpark.Tenants.Contracts;
using Zeta.Inpark.Tenants.Entities;
using Zeta.Inpark.Tenants.Errors;
using Zeta.Inpark.Tenants.Features;

namespace Zeta.Inpark.Tenants.Tests.Features.Tenants
{
    [TestFixture]
    [Category(Categories.Integration)]
    public class GetServiceTest : TestBase
    {
        [Test]
        public async Task Handle_ShouldReturnTenantNotFound_WhenNoTenantIsFound()
        {
            //Arrange 
            var query = new GetService.Query(Guid.NewGuid(), "ServiceId");

            //Act
            var response = await Send(query);

            //Assert
            response.Value.Should().BeOfType<TenantNotFound>();
        }

        [Test]
        public async Task Handle_ShouldReturnServiceNotFound_whenNoServiceIsFound()
        {
            //Arrange 
            var tenant = await Add(Fixture.Valid<Tenant>().Create());
            var query = new GetService.Query(tenant.Id, "ServiceId");

            //Act
            var response = await Send(query);

            //Assert
            response.Value.Should().BeOfType<ServiceNotFound>();
        }

        [Test]
        public async Task Handle_ShouldReturnServiceDto_WhenServiceExists()
        {
            //Arrange
            var service = Fixture.Valid<Service>()
                .WithMany(x => x.Features, 1)
                .Create();
            var tenant = await Add(
                Fixture.Valid<Tenant>()
                    .With(x => x.Services, new List<Service>(){service})
                    .Create());
            
            var query = new GetService.Query(tenant.Id, service.ServiceId);

            //Act
            var response = await Send(query);

            //Assert
            response.Value.Should().BeOfType<ServiceDto>();
            var dbService = await Find<Service>(tenant.Services.First().Id);
            dbService!.ServiceId.Should().Be(service.ServiceId);
        }
    }
}
