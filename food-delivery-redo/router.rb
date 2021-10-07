class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    show_manager_menu
    @action = gets.chomp.to_i
    execute_manager_action
  end

  private

  def show_manager_menu
    puts '\nHere are your options:\n'
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. Edit a meal'
    puts '4. List all customers'
    puts '5. Add a customer'
    puts '0. Exit'
    puts ''
  end

  def execute_manager_action
    case @action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 0 then stop
    else
      puts 'Wrong choice...'
    end
  end

  def stop
    @running = false
  end
end
