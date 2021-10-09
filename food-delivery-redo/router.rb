class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    @employee = @sessions_controller.sign_in
    while @running
      if @employee.role == 'manager'
        show_manager_menu
        @action = gets.chomp.to_i
        print `clear`
        execute_manager_action
      else
        show_rider_menu
        @action = gets.chomp.to_i
        print `clear`
        execute_rider_action
      end
    end
  end

  private

  def show_manager_menu
    puts "\nHere are your options:\n"
    puts '------------------'
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. Edit a meal'
    puts '4. Delete a meal'
    puts '5. List all customers'
    puts '6. Add a customer'
    puts '7. Edit a customer'
    puts '8. Delete a customer'
    puts '9. List all undelivered orders'
    puts '10. Add an order'
    puts '0. Exit'
    puts '------------------'
  end

  def show_rider_menu
    puts "\nHere are your options:\n"
    puts '1. Mark one of my order as delivered'
    puts '2. See all my undelivered orders'
    puts '0. Exit'
    puts ''
  end

  def execute_manager_action
    case @action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.destroy
    when 9 then @orders_controller.list_all_undelivered
    when 10 then @orders_controller.add
    when 0 then stop
    else
      puts 'Wrong choice...'
    end
  end

  def execute_rider_action
    case @action
    when 1 then @orders_controller.mark_my_order(@employee)
    when 2 then @orders_controller.list_my_undelivered(@employee)
    when 0 then stop
    else
      puts 'Wrong choice...'
    end
  end

  def stop
    @running = false
  end
end
