using System;
using System.Collections.Generic;
using System.Linq;
using DomainFixture;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Tests.Entities;

[TestFixture]
[Category(Categories.Unit)]
public class AdminTests
{
    [Test]
    public void CreateRefreshToken_ShouldAddRefreshToken()
    {
        // Arrange
        var sut = Fixture.Valid<Admin>()
            .With(x => x.RefreshTokens, new List<RefreshToken>())
            .Create();

        // Act
        var result = sut.CreateRefreshToken();

        // Assert
        sut.RefreshTokens.Should().HaveCount(1)
            .And.Contain(result);
    }
    
    [Test]
    public void CreateRefresh_ShouldHaveTheRefreshTokenSetToExpireIn_30Days()
    {
        // Arrange
        var sut = Fixture.Valid<Admin>().Create();
        var expiresAt = DateTime.Now.AddDays(30);
        
        // Act
        var result = sut.CreateRefreshToken();

        // Assert
        result.ExpiresAt.Should().BeCloseTo(expiresAt, TimeSpan.FromMinutes(1));
    }

    [Test]
    public void RemoveRefreshToken_ShouldRemoveRefreshToken()
    {
        // Arrange
        var sut = Fixture.Valid<Admin>()
            .WithMany(x => x.RefreshTokens, 1)
            .Create();
        var refreshToken = sut.RefreshTokens.First();

        // Act
        sut.RemoveRefreshToken(refreshToken);
        
        // Assert
        sut.RefreshTokens.Should().BeEmpty();
    }
}