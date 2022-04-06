namespace DomainFixture.FixtureBuilder;

public interface IFixtureConfiguration<TFixture>
    where TFixture : class
{
    public TFixture Apply(TFixture instance);
}