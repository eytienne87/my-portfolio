class OrderView
  def display_undelivered(undelivered)
    undelivered.each do |order|
      status = order.delivered? ? '[  X  ]' : '[     ]'
      puts "#{order.id}. #{order.meal.name.capitalize} #{status}"
      puts "#{order.customer.name.capitalize} - #{order.customer.address.capitalize}"
      puts "Assigned to: #{order.employee.username.capitalize}"
      puts ''
    end
  end

  def ask_which(content)
    puts "Select a #{content}:"
    gets.chomp.to_i - 1
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. [ $ #{meal.price}  ] #{meal.name.capitalize}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name.capitalize} - #{customer.address}"
    end
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username.capitalize}"
    end
  end

  def ask_for_id
    puts 'Which order would you like to mark as done?'
    gets.chomp.to_i
  end

  def confirmation(content)
    puts "Your order has been #{content}."
  end
end
