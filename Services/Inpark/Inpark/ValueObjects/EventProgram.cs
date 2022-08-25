using Zeta.Inpark.Common;

namespace Zeta.Inpark.ValueObjects
{
    public class ProgramEvent : ValueObject
    {
        public DateTime StartTime { get; private set; }
        public DateTime? EndTime { get; private set; }
        public string Description { get; private set; } = null!;

        private ProgramEvent()
        {

        }

        public static ProgramEvent From(DateTime startTime, string description, DateTime? endTime = null)
        {
            var instance = new ProgramEvent
            {
                StartTime = startTime,
                EndTime = endTime,
                Description = description,
            };
            instance.Validate();

            return instance;
        }

        protected override IEnumerable<object?> GetEqualityComponents()
        {
            yield return StartTime;
            yield return EndTime;
            yield return Description;
        }
    }

    public class ProgramEventValidator : AbstractValidator<ProgramEvent>
    {
        public ProgramEventValidator()
        {
            RuleFor(x => x.StartTime).NotEmpty();
            When(x => x.EndTime != null, () =>
            {
                RuleFor(x => x.StartTime).LessThan(x => x.EndTime);
            });
            RuleFor(x => x.EndTime).GreaterThan(x => x.StartTime);
            RuleFor(x => x.Description).NotEmpty();
        }
    }
}
