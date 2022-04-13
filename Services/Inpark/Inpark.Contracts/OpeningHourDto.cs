namespace Zoo.Inpark.Contracts;

public record OpeningHourDto(
    string Name,
    DateTimeOffset Start,
    DateTimeOffset End,
    bool Open
);