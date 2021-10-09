require 'io/console'

class SessionView
  def ask_user_for_username
    puts 'Username:'
    gets.chomp
  end

  def ask_user_for_password
    STDIN.getpass('Password:')
  end

  def welcome(username)
    puts "Welcome to the Food Delivery App #{username}!"
  end

  def wrong_credentials(username)
    puts "Please try again, #{username} is not a valid username."
  end
end
