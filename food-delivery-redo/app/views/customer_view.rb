class CustomerView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_customer_info(info)
    puts "What is the #{info} of the customer that you want to add?"
    gets.chomp
  end
end
