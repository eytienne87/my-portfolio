require_relative 'recipe'
require_relative 'view'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end

  def create
    name = @view.ask("name")
    description = @view.ask("description")
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    index = @view.ask_for_index
    @cookbook.remove_recipe(index)
  end

  def web_search
    # Ask the user for an ingredient
    ingredient = @view.ask_for_ingredient
    # Obtain 5 recipe names using that ingredient on www.simplyrecipes.com
    scraper_name(ingredient)
  end

  private

  def scraper_name(ingredient)
    url = "https://www.simplyrecipes.com/search?q=#{ingredient}"
    html_doc = open(url).read
    doc = Nokogiri::HTML(html_doc)

    names = doc.search('.card__underline').first(5).map do |name|
      name.text.strip
    end
  end
end
