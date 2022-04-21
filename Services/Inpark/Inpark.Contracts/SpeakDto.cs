namespace Zoo.Inpark.Contracts;

public record SpeakDto(
    string Title,
    DateTime Start,
    DateTime End,
    List<string> Days
);