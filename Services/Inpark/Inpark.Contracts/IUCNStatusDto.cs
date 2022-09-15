using System.Diagnostics.CodeAnalysis;

namespace Zeta.Inpark.Contracts;

[SuppressMessage("ReSharper", "InconsistentNaming")]
public enum IUCNStatusDto
{
    Unknown, EX, EW, CR, EN, VU, NT, LC
}