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
end
