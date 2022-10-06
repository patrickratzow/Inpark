using System;
using System.Threading.Tasks;
using MediatR;
using Zeta.Inpark.Auth.Features.Admin;
using Zeta.Inpark.Auth.Services;

namespace Zeta.Inpark.Auth.Tests.Features.Admin;

[TestFixture]
[Category(Categories.Unit)]
public class IsTokenValidTests : TestBase
{
    [TestCase(JwtService.JwtValidationResult.Valid, typeof(Unit))]
    [TestCase(JwtService.JwtValidationResult.Invalid, typeof(IsTokenValid.InvalidToken))]
    [TestCase(JwtService.JwtValidationResult.Expired, typeof(IsTokenValid.ExpiredToken))]
    public async Task Handle_ShouldReturnState(JwtService.JwtValidationResult state, Type returnType)
    {
        // Arrange
        
        // Act
        
        // Assert
        
    }
}