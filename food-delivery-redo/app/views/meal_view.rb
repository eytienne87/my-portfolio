class MealView
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. [ $ #{meal.price} ] #{meal.name.capitalize}"
    end
  end

  def ask_for_meal_info(info)
    puts "What is the #{info} of the meal?"
    gets.chomp
  end

  def ask_for_meal_index(info)
    puts "Which of the following meals would you like to #{info} (number)?"
    gets.chomp.to_i - 1
  end

  def confirmation(content)
    puts "The meal was successfully #{content}."
  end
end
