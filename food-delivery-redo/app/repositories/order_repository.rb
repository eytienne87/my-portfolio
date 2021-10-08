require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @csv_file = csv_file
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
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

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
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
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id','delivered','meal_id','customer_id','employee_id']
      @orders.each do |order| csv <<
        [order.id, order.delivered, order.meal.id,
         order.customer.id, order.employee.id]
      end
    end
  end
end
