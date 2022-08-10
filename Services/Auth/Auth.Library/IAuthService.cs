namespace Auth.Library;

public interface IAuthService
{
    ValueTask<bool> HasPermission(string jwt, string permissionId);
    ValueTask<bool> IsValid(string jwt);
}