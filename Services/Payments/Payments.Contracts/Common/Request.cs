namespace Zoo.Payments.Contracts.Common;

public abstract record Request : IValidatable
{
    public virtual void Validate() => ValidationService.Validate(this, typeof(Request));
}