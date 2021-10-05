require 'csv'
require_relative '../models/meal.rb'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_filepath)
  end

  def all
    @meals
  end

  def add_one_meal(meal)
    @next_id = meal.id
    @meals << meal
    @next_id += 1
    save_csv
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
      @meals << Meal.new(row[:id].to_i, row[:name], row[:price].to_i)
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
