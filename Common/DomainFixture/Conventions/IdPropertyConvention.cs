using System.Reflection;

namespace DomainFixture.Conventions;

public class IdPropertyConvention : IPropertyConvention<int>, IPropertyConvention<long>
{
    public IGenericPropertyBuilder<int, TEntity> Run<TEntity>(PropertyInfo propertyInfo,
        IGenericPropertyBuilder<int, TEntity> builder)
    {
        if (propertyInfo.Name != "Id") return builder;
        if (builder is not ConventionsPropertyBuilder<int, TEntity> { IsEmpty: true }) return builder;

        return builder.Valid(0, 1).Invalid(-1);
    }

    public IGenericPropertyBuilder<long, TEntity> Run<TEntity>(PropertyInfo propertyInfo,
        IGenericPropertyBuilder<long, TEntity> builder)
    {
        if (propertyInfo.Name != "Id") return builder;
        if (builder is not ConventionsPropertyBuilder<long, TEntity> { IsEmpty: true }) return builder;

        return builder.Valid(0, 1).Invalid(-1);
    }
}