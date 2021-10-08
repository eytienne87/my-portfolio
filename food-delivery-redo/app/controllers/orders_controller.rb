class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
  end

  def list
    undelivered = @order_repository.all_undelivered
    @order_view.display_undelivered(undelivered)
  end
end
