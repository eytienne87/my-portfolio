require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    customers = @customer_repository.all
    @customer_view.display_customers(customers)
  end

  def add
    # Obtain info about the customer
    name = @customer_view.ask_for_customer_info("name")
    address = @customer_view.ask_for_customer_info("address")
    # Store it into a customer instance
    customer = Customer.new(name: name, address: address)
    # Add it to our customer repository (database)
    @customer_repository.add_one_customer(customer)
  end
end
