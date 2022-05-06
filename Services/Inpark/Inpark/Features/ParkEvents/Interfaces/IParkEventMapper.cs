using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Zoo.Inpark.Entities;
using Zoo.Inpark.Models;

namespace Zoo.Inpark.Features.Events.Interfaces;

public interface IParkEventMapper
{
    Result<List<ParkEvent>, string> ParseParkEvent(string input);
    Result<List<IContent>, string> ParseContent(string content);
}

