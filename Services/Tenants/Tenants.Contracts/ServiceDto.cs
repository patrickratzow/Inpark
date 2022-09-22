namespace Zeta.Inpark.Tenants.Contracts;

public record ServiceDto(
    string ServiceId,
    List<FeatureDto> Features
);