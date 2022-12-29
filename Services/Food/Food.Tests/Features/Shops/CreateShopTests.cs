using Bogus;
using DomainFixture;
using FluentAssertions;
using Food.Tests;
using MediatR;
using Zeta.Inpark.Food.Entities;
using Zeta.Inpark.Food.Features.Merchants;

namespace Zeta.Inpark.Food.Tests.Features.Shops;

[Category(Categories.Integration)]
[TestFixture]
public class CreateShopTests : TestBase
{
  [Test]
  public async Task CreateShop_WhenMerchant_Exists()
  {
    // Arrange
    var merchant = await Create<Merchant>();
    var command = new Faker<CreateShop.Command>()
        .CustomInstantiator(f => new(
            Guid.NewGuid(),
            merchant.Id,
            f.Company.CompanyName(),
            f.Lorem.Paragraph()
        ))
        .Generate();

    // Act
    var result = await Send(command);

    // Assert
    result.Should().BeOfType<Unit>();
    await ShouldFind<Merchant>(command.Id);
  }

  [Test]
  public async Task CvrNumberAlreadyExists_WhenCvrNumber_IsInUse()
  {
    const string CvrNumber = "12345678";
    // Arrange
    await Add(
        Fixture.Valid<Merchant>()
            .With(x => x.CvrNumber, ValueObjects.CvrNumber.From(CvrNumber))
            .Create()
    );
    var command = new Faker<CreateMerchant.Command>()
        .CustomInstantiator(f => new(
            Guid.NewGuid(),
            f.Company.CompanyName(),
            CvrNumber
        ))
        .Generate();

    // Act
    var result = await Send(command);

    // Assert
    var response = result.Should().BeOfType<CreateMerchant.CvrNumberAlreadyExists>();
    response.CvrNumber.Should().Be(CvrNumber);
    var count = await Count<Merchant>();
    count.Should().Be(1);
  }
}