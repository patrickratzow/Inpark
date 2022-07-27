using System.Security.Cryptography;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Zeta.Inpark.Auth.ValueObjects;

namespace Zeta.Inpark.Auth.Services;

public class PasswordService
{
    public Password CreatePassword(string password)
    {
        var salt = CreateSalt();
        var hash = GenerateHash(password, salt);
        
        return Password.From(hash, Convert.ToBase64String(salt));
    }
    
    public bool VerifyPassword(string passwordInput, Password password)
    {
        var hash = GenerateHash(passwordInput, Convert.FromBase64String(password.Salt));
        
        return hash == password.Hash;
    }
    
    private static byte[] CreateSalt()
    {
        Span<byte> salt = stackalloc byte[16];
        RandomNumberGenerator.Fill(salt);

        return salt.ToArray();
    }

    private static string GenerateHash(string input, byte[] salt)
    {
        var hash = KeyDerivation.Pbkdf2(
            password: input,
            salt: salt,
            prf: KeyDerivationPrf.HMACSHA1,
            iterationCount: 10000,
            numBytesRequested: 32
        );

        return Convert.ToBase64String(hash);
    }
}