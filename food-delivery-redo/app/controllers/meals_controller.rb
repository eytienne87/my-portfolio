require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    meals = @meal_repository.all
    @meal_view.display_meals(meals)
  end

  def add
    # Obtain info about the meal
    name = @meal_view.ask_user_for_info("name")
    price = @meal_view.ask_user_for_info("price")
    # Store it into a meal instance
    meal = Meal.new(name: name, price: price)
    # Add it to our meal repository (database)
    @meal_repository.add_one_meal(meal)
  end
end
