using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Zeta.Inpark.Auth.Entities;

namespace Zeta.Inpark.Auth.Services;

public class JwtOptions
{
    public const string Position = "Jwt";

    public string Secret { get; set; } = string.Empty;
    public double ValidForMinutes { get; set; } = 0;
} 

public class JwtService
{
    private readonly JwtOptions _options;

    public JwtService(IOptions<JwtOptions> options)
    {
        _options = options.Value;
    }
    
    public string GenerateToken(Admin admin)
    {
        var now = DateTime.UtcNow;
        var claims = new List<Claim>
        {
            new(JwtRegisteredClaimNames.Sub, admin.Id.ToString()),
            new(JwtRegisteredClaimNames.Email, admin.EmailAddress.Value),
            new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new(JwtRegisteredClaimNames.Iat, now.ToUniversalTime().ToString(), ClaimValueTypes.Integer64)
        };
        var expires = now.AddMinutes(_options.ValidForMinutes);
        var key = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_options.Secret));
        var signingCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        var jwt = new JwtSecurityToken(
            issuer: "Zeta.Inpark.Auth",
            claims: claims,
            notBefore: now,
            expires: expires,
            signingCredentials: signingCredentials
        );
        var token = new JwtSecurityTokenHandler().WriteToken(jwt);
        
        return token;
    }

    public JwtValidationResult IsValid(string token)
    {
        try
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            tokenHandler.ValidateToken(token, new()
            {
                ValidateIssuer = true,
                ValidateAudience = false,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                ValidIssuer = "Zeta.Inpark.Auth",
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(_options.Secret))
            }, out _);
        }
        catch (SecurityTokenExpiredException ex)
        {
            return JwtValidationResult.Expired;
        }
        catch (Exception ex)
        {
            return JwtValidationResult.Invalid;
        }
        
        return JwtValidationResult.Valid;    
    }
    
    public enum JwtValidationResult
    {
        Valid,
        Invalid,
        Expired
    }
}