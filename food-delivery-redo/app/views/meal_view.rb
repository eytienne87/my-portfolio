class MealView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. [ $ #{meal.price} ] #{meal.name}"
    end
  end

  def ask_user_for_info(info)
    puts "What is the #{info} of the meal that you want to add?"
  end
end
