namespace Zoo.Common.Api.Jobs;

public class JobAttribute : Attribute
{
    public string Id { get; set; }
    
    public JobAttribute(string id) { Id = id; }
}