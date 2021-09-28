require_relative 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
  end
end
