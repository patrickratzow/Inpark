using DomainFixture.FixtureBuilder;

namespace DomainFixture;

public static class Fixture
{
    public static FixtureBuilder<TFixture> Valid<TFixture>()
        where TFixture : class
        => new();
}