using MediatR;
using OneOf;
using Zeta.Inpark.Translator.Services;

namespace Zeta.Inpark.Translator.Features;

public static class TranslateText
{
    public record Query(
        Guid UserId,
        string To,
        string Text
    ) : IRequest<OneOf<string>>;

    public class Handler : IRequestHandler<Query, OneOf<string>>
    {
        private readonly ITranslator _translator;

        public Handler(ITranslator translator)
        {
            _translator = translator;
        }

        public async Task<OneOf<string>> Handle(Query request, CancellationToken cancellationToken)
        {
            var result = await _translator.TranslateText(request.To, request.Text);

            return result;
        }
    }
}