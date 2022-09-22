using Microsoft.AspNetCore.Mvc;
using OneOf;
using Zeta.Common.Api;

namespace Zeta.Inpark.Tenants.Functions;

public abstract class HttpTrigger
{
    private readonly IResponseMapper _mapper;

    protected HttpTrigger(IResponseMapper mapper)
    {
        _mapper = mapper;
    }

    protected ResponseMappingBuilder<T0> Map<T0>(OneOf<T0> oneOf) => _mapper.Map(oneOf);
    protected ResponseMappingBuilder<T0, T1> Map<T0, T1>(OneOf<T0, T1> oneOf) => _mapper.Map(oneOf);
    protected ResponseMappingBuilder<T0, T1, T2> Map<T0, T1, T2>(OneOf<T0, T1, T2> oneOf) => _mapper.Map(oneOf);
}
