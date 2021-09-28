class View
  # List all recipes
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end
  # Create a recipe
  def ask(content)
    puts "What is the #{content} of the recipe you would like to add?"
    gets.chomp
  end
  # Delete a recipe
  def ask_for_index
    puts "Which recipe would you like to delete (number) ?"
    gets.chomp.to_i - 1
  end

end
