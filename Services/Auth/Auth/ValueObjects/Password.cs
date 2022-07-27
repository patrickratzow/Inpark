namespace Zeta.Inpark.Auth.ValueObjects;

public class Password : ValueObject
{
    public string Hash { get; private set; }
    public string Salt { get; private set; }
    
    private Password() { }
    
    public static Password From(string hash, string salt)
    {
        var instance = new Password
        {
            Hash = hash,
            Salt = salt
        };
        instance.Validate();

        return instance;
    }

    public override string ToString() => $"{Salt}.{Hash}";

    protected override IEnumerable<object?> GetEqualityComponents()
    {
        yield return Hash;
        yield return Salt;
    }
}