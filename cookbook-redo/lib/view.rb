class View
  # List all recipes
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? '[ DONE ]' : '[      ]'
      puts "#{index + 1}. #{status} -  #{recipe.name.capitalize}: #{recipe.description.capitalize}"
    end
  end
  # Create a recipe
  def ask(content)
    puts "What is the #{content} of the recipe you would like to add?"
    gets.chomp
  end
  # Delete a recipe
  def ask_for_index(content)
    puts "Which recipe would you like to #{content} (number) ?"
    gets.chomp.to_i - 1
  end
  # Web search
  def ask_for_ingredient
    puts "What ingredient would you like us to search the web with?"
    gets.chomp
  end

  def display_recipes_from_web(names, descriptions)
    names.each_with_index do |name, index|
      puts "#{index + 1}. #{name}: #{descriptions[index]}"
    end
  end
end
