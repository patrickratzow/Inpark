using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zoo.Inpark.Features.Events.Interfaces;

public interface IParkEventRepository
{
    ValueTask<Result<string, string>> GetContent();
}

