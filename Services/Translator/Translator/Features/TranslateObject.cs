using System.Collections.Concurrent;
using MediatR;
using OneOf;
using Zeta.Inpark.Translator.Services;

namespace Zeta.Inpark.Translator.Features;

public static class TranslateObject
{
    public record Query(
        Guid UserId,
        string To,
        Dictionary<string, string> Input,
        HashSet<string> Properties
    ) : IRequest<OneOf<object>>;

    public class Handler : IRequestHandler<Query, OneOf<object>>
    {
        private readonly ITranslator _translator;

        public Handler(ITranslator translator)
        {
            _translator = translator;
        }

        public async Task<OneOf<object>> Handle(Query request, CancellationToken cancellationToken)
        {
            var dictionary = new ConcurrentDictionary<string, string>(request.Input);

            await Parallel.ForEachAsync(request.Properties, cancellationToken, async (propertyString, _) =>
            {
                if (!dictionary.TryGetValue(propertyString, out var propertyValue)) return;
                
                var text = await _translator.TranslateText(request.To, propertyValue);
                dictionary.TryUpdate(propertyString, text, propertyValue);
            });

            return dictionary;
        }
    }
}