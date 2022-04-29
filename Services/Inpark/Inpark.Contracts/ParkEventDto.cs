using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zoo.Inpark.Contracts;

public record ParkEventDto(
    Guid Id,
    AnimalImageDto Image,
    string Title,
    DateTime Start,
    DateTime End,
    List<ContentDto> DescriptionContent,
    List<ContentDto> ProgramContent
);

