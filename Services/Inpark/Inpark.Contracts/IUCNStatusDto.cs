using System.Diagnostics.CodeAnalysis;

namespace Zoo.Inpark.Contracts;

[SuppressMessage("ReSharper", "InconsistentNaming")]
public enum IUCNStatusDto
{
    Unknown, EX, EW, CR, EN, VU, NT, LC
}