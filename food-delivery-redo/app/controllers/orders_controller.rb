require_relative '../views/order_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @order_view = OrderView.new
  end

  def list_all_undelivered
    undelivered = @order_repository.all_undelivered
    @order_view.display_undelivered(undelivered)
  end

  def add
    # Display meals and get a meal id
    meals = @meal_repository.all
    @order_view.display_meals(meals)
    meal_index = @order_view.ask_which_meal
    meal_id = meals[meal_index].id
    # Display customers and get a customer id
    customers = @customer_repository.all
    @order_view.display_customers(customers)
    cus_index = @order_view.ask_which_customer
    cus_id = customers[cus_index].id
    # Display employees (riders) and get an employee id
    riders = @employee_repository.all_riders
    @order_view.display_riders(riders)
    emp_index = @order_view.ask_which_rider
    emp_id = riders[emp_index].id
    # Get all 3 instances using the ids
    meal = @meal_repository.find(meal_id)
    cus = @customer_repository.find(cus_id)
    emp = @employee_repository.find(emp_id)
    # Create an instance of Order
    order = Order.new(meal: meal, customer: cus, employee: emp)
    # Add it to the repository
    @order_repository.add(order)
  end

  def mark_my_order(employee)
    # See a list of all the rider's undelivered orders
    list_my_undelivered(employee)
    # Ask him/her which order he wants to mark as delivered
    order_id = @order_view.ask_for_id
    # Change the value of 'delivered' for that order
    order = @order_repository.find(order_id)
    order.delivered!
    # Display a message to notify that the item has been marked
    @order_view.confirmation
  end

  def list_my_undelivered(employee)
    undelivered = @order_repository.all_undelivered
    my_undelivered = undelivered.select do |order|
      order.employee.username == employee.username
    end
    @order_view.display_undelivered(my_undelivered)
  end
end
