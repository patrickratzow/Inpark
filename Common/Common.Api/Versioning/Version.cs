using System.Text;

namespace Zoo.Common.Api.Versioning;

public record Version(
    int Major,
    int Minor,
    int Patch,
    int? BuildNumber = null
)
{
    public override string ToString()
    {
        var builder = new StringBuilder($"{Major}.{Minor}.{Patch}");
        if (BuildNumber is not null)
        {
            builder.Append($".{BuildNumber}");
        }

        return builder.ToString();
    }
}