using Zeta.Inpark.Food.Common;

namespace Zeta.Inpark.Food.Entities;

public class Category : Entity
{
    public Guid Id { get; private set; }
    private List<Food> _foods = new();
    public IReadOnlyCollection<Food> Foods
    {
        get => _foods;
        private set => _foods = value.ToList();
    }

    private Category()
    {
    }

    public Result<Food, string> AddFood(Food food)
    {
        var existingFood = _foods.Find(x => x.Id == food.Id);
        if (existingFood is not null) return "Food is already in the category";
        if (existingFood?.Category is not null) return "Food already has a category";
        
        _foods.Add(food);

        return food;
    }
}