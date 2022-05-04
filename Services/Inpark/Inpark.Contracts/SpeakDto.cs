namespace Zoo.Inpark.Contracts;

public record SpeakDto(
    string Title,
    DateTime Start,
    DateTime End,
    ImagePairDto Image,
    List<string> Days
);