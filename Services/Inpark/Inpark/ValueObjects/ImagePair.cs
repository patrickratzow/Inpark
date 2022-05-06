using Zoo.Inpark.Common;

namespace Zoo.Inpark.ValueObjects;

public class ImagePair : ValueObject
{
    private ImagePair(){}

    public string PreviewUrl { get; private set; } = null!;
    public string FullscreenUrl { get; private set; } = null!;

    public static ImagePair From(string previewUrl, string fullscreenUrl)
    {
        var instance = new ImagePair()
        {
            PreviewUrl = previewUrl,
            FullscreenUrl = fullscreenUrl
        };
        instance.Validate();
        return instance;
    }
    
    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return PreviewUrl;
        yield return FullscreenUrl;
    }
}


public class AnimalImageValidator : AbstractValidator<ImagePair>
{
    public AnimalImageValidator()
    {
        RuleFor(x => x.PreviewUrl).NotEmpty();
        RuleFor(x => x.FullscreenUrl).NotEmpty();
    }
}

