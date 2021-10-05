require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'router'


meals_csv = File.join(__dir__, 'meals.csv')
meal_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)

# Starting the app
router.run
