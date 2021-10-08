class SessionView

  def ask_user_for_info(info)
  puts "Please enter your #{info}"
  gets.chomp
  end

  def welcome(username)
    puts "Welcome to the Food Delivery App #{username}!"
  end

  def wrong_credentials(username)
    puts "Please try again, #{username} is not a valid username."
  end
end
