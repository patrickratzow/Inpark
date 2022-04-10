namespace Zoo.Inpark.Contracts;

public record ContentDto(object Value, string Type, List<ContentDto> Children);