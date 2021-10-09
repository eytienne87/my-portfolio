class CustomerView
  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name.capitalize} - #{customer.address}"
    end
  end

  def ask_for_customer_info(info)
    puts "What is the #{info} of the customer?"
    gets.chomp
  end

  def ask_for_customer_index(info)
    puts "Which of the following customers would you like to #{info} (number)?"
    gets.chomp.to_i - 1
  end

  def confirmation(content)
    puts "The customer was successfully #{content}."
  end
end
