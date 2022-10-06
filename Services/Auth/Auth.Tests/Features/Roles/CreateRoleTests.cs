using System;
using System.Threading.Tasks;
using DomainFixture;
using MediatR;
using Zeta.Common.Api;
using Zeta.Inpark.Auth.Entities;
using Zeta.Inpark.Auth.Features.Roles;
using Tenant = Zeta.Inpark.Auth.Entities.Tenant;

namespace Zeta.Inpark.Auth.Tests.Features.Roles;

[TestFixture]
public class CreateRoleTests : TestBase
{
    [Test]
    public async Task Handler_ShouldCreateRole_WhenNameIsNotTaken()
    {
        // Arrange
        var command = new CreateRole.Command(
            Guid.NewGuid(),
            "Admin",
            "000000"
        );
        
        // Act
        var result = await Send(command);

        // Assert
        result.Value.Should().BeOfType<Unit>();
        var count = await Count<Role>();
        count.Should().Be(1);
    }
    
    [Test]
    public async Task Handler_ShouldNotCreateRole_WhenNameIsNotTaken()
    {
        // Arrange
        var role = await CreateRole();
        var command = new CreateRole.Command(
            Guid.NewGuid(),
            role.Name,
            "000000"
        );
        
        // Act
        var result = await Send(command);

        // Assert
        result.Value.Should().BeOfType<CreateRole.NameIsAlreadyTaken>();
        var count = await Count<Role>();
        count.Should().Be(1);
    }

    private async Task<Role> CreateRole()
    {
        var context = GetRequiredService<AuthDbContext>();
        var tenantManager = GetRequiredService<ITenantManager>();
        var role = Fixture.Valid<Role>()
            .With(x => x.Name, "Admin")
            .Create();
        var tenant = await Find<Tenant>(tenantManager.Tenant.Id);
        role = tenant!.CreateRole(role.Id, role.Name, role.Color);

        context.Roles.Add(role);
        await context.SaveChangesAsync();
        
        return role;
    }
}