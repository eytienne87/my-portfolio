require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def sign_in
    # Ask user for username and password
    username = @session_view.ask_user_for_username
    password = @session_view.ask_user_for_password
    # Verify that the username is in our database
    employee = @employee_repository.find_employee_by_username(username)
    # Login the person if the credentials are correct, otherwise ask again
    if employee && employee.password == password
      @session_view.welcome(username)
      employee
    else
      @session_view.wrong_credentials
      sign_in
    end
  end
end
