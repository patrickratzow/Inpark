using System;
using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.Entities;

[TestFixture]
public class RefreshTokenTests
{
    [Test]
    public void IsExpired_ReturnsFalse_WhenExpiresAtIsInTheFuture()
    {
        // Arrange
        var sut = Fixture.Valid<RefreshToken>()
            .With(x => x.ExpiresAt, DateTime.Now.AddSeconds(10))
            .Create();
        
        // Act
        var result = sut.IsExpired();
        
        // Assert
        result.Should().BeFalse();
    }
    
    [Test]
    public void IsExpired_ReturnsTrue_WhenExpiresAtIsInThePast()
    {
        // Arrange
        var sut = Fixture.Valid<RefreshToken>()
            .With(x => x.ExpiresAt, DateTime.Now.AddSeconds(-10))
            .Create();
        
        // Act
        var result = sut.IsExpired();
        
        // Assert
        result.Should().BeTrue();
    }
}