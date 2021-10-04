require 'csv'
require_relative '../models/meal.rb'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
  end

  def all
    @meals
  end

  def add_one_meal(meal)
    @meals << meal
  end

  def find_meal_by_id(id)
    @meals.find do |meal|
      meal.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
    end
  end

  def save_csv
  end

end
