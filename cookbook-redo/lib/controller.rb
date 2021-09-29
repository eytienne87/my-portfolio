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
    name = @view.ask('name')
    description = @view.ask('description')
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
    names = scraper_name(ingredient)
    # Obtain links to the 5 individual recipe pages using that ingredient
    links = scraper_links_to_recipe_pages(ingredient)
    # Obtain 5 recipe descriptions on those different pages
    descriptions = scraper_description(links)
    # Display the 5 options to the user
    @view.display_recipes_from_web(names, descriptions)
  end

  private

  # Scraping names
  def scraper_name(ingredient)
    url = "https://www.simplyrecipes.com/search?q=#{ingredient}"
    html_doc = URI(url).open.read
    doc = Nokogiri::HTML(html_doc)

    names = doc.search('.card__underline').first(5).map do |name|
      name.text.strip
    end
  end

  # Scraping descriptions
  def scraper_links_to_recipe_pages(ingredient)
    url = "https://www.simplyrecipes.com/search?q=#{ingredient}"
    html_doc = URI(url).open.read
    doc = Nokogiri::HTML(html_doc)

    doc.search('.card-list__item').first(5).map do |card|
      card.at_css('a').attributes['href'].value
    end
  end

  def scraper_description(links)
    links.map do |link|
      html_doc = URI(link).open.read
      doc = Nokogiri::HTML(html_doc)

      doc.search('.heading__subtitle').text
    end
  end
end
