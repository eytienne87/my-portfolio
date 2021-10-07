require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def add_one_meal(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find_meal_by_id(id)
    @meals.find do |meal|
      meal.id == id
    end
  end

  def update(index, name, price)
    meal = @meals[index]
    meal.name = name
    meal.price = price
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      meal = Meal.new(row)
      @meals << meal
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id','name','price']
      @meals.each { |meal| csv << [meal.id, meal.name, meal.price] }
    end
  end

end
