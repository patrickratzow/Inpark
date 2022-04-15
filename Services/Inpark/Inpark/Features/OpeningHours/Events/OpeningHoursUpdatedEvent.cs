using Zoo.Inpark.Common;
using Zoo.Inpark.Entities;

namespace Zoo.Inpark.Features.OpeningHours.Events;

public record OpeningHoursUpdatedEvent(List<OpeningHour> OpeningHours) : DomainEvent;