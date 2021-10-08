class OrderView
  def display_undelivered(undelivered)
    undelivered.each do |order|
      puts "#{order.id}. #{order.meal.name.capitalize}"
      puts "#{order.customer.name.capitalize} - #{order.customer.address.capitalize}"
      puts "Assigned to: #{order.employee.username.capitalize}"
    end
  end
end
