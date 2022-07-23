namespace Zoo.Common.Api;

public record Tenant(
    Guid Id,
    AnimalProvider AnimalProvider
);