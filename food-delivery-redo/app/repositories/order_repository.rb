require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@orders_csv_path)
  end

  def all_undelivered
    @orders.select { |order| order.delivered == false }
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def find(id)
    @orders.find do |order|
      order.id == id
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@orders_csv_path, csv_options) do |row|
      # I'm using these 2-3 letter words to save space
      id = row[:id].to_i
      del = row[:delivered] == 'true'
      me = @meal_repository.find(row[:meal_id].to_i)
      cu = @customer_repository.find(row[:customer_id].to_i)
      emp = @employee_repository.find(row[:employee_id].to_i)

      order = Order.new(id: id, delivered: del, meal: me, customer: cu, employee: emp)
      @orders << order
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@orders_csv_path, 'wb') do |csv|
      csv << ['id','delivered','meal_id','customer_id','employee_id']
      # I'm using 'o' to save space
      @orders.each { |o| csv << [o.id, o.delivered, o.meal.id, o.customer.id, o.employee.id] }
    end
  end
end
