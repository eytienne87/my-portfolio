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
    name = @meal_view.ask_for_meal_info("name")
    price = @meal_view.ask_for_meal_info("price").to_i
    # Store it into a meal instance
    meal = Meal.new(name: name, price: price)
    # Add it to our meal repository (database)
    @meal_repository.add(meal)
    # Notify the user that the meal was added
    @meal_view.confirmation('added')
  end

  def edit
    # Display the list of meals
    list
    # Ask user which meal he wants to edit
    index = @meal_view.ask_for_meal_index('edit')
    # Ask him for a new name and price of his choice
    edited_name = @meal_view.ask_for_meal_info('edited name')
    edited_price = @meal_view.ask_for_meal_info('edited price').to_i
    # Update the meal
    @meal_repository.update(index, edited_name, edited_price)
    # Notify the user that the meal was edited
    @meal_view.confirmation('edited')
  end

  def destroy
    # Display the list of meals
    list
    # Ask user which meal he wants to delete
    index = @meal_view.ask_for_meal_index('delete')
    # Delete the meal
    @meal_repository.delete(index)
    # Notify the user that the meal was deleted
    @meal_view.confirmation('deleted')
  end
end
