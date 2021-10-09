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
    name = @customer_view.ask_for_customer_info('name')
    address = @customer_view.ask_for_customer_info('address')
    # Store it into a customer instance
    customer = Customer.new(name: name, address: address)
    # Add it to our customer repository (database)
    @customer_repository.add(customer)
    # Notify the user that the customer was added
    @customer_view.confirmation('added')
  end

  def edit
    # Display the list of customers
    list
    # Ask user which customer he wants to edit
    index = @customer_view.ask_for_customer_index('edit')
    # Ask him for a new name and address of his choice
    edited_name = @customer_view.ask_for_customer_info('edited name')
    edited_address = @customer_view.ask_for_customer_info('edited address')
    # Update the customer
    @customer_repository.update(index, edited_name, edited_address)
    # Notify the user that the customer was edited
    @customer_view.confirmation('edited')
  end

  def destroy
    # Display the list of customers
    list
    # Ask user which customer he wants to delete
    index = @customer_view.ask_for_customer_index('delete')
    # Delete the customer
    @customer_repository.delete(index)
    # Notify the user that the customer was deleted
    @customer_view.confirmation('deleted')
  end
end
