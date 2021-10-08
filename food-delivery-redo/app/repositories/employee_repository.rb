require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all_riders
    @employees.select do |employee|
      employee.role == 'rider'
    end
  end

  def find_employee_by_id(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  def find_employee_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i

      employee = Employee.new(row)
      @employees << employee
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id','username','password','role']
      @employees.each { |employee| csv << [employee.id, employee.username, employee.password, employee.role] }
    end
  end

end
