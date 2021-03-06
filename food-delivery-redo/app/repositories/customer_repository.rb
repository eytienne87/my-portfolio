require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def find(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def update(index, name, address)
    customer = @customers[index]
    customer.name = name
    customer.address = address
    save_csv
  end

  def delete(index)
    @customers.delete_at(index)
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i

      customer = Customer.new(row)
      @customers << customer
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id','name','address']
      @customers.each { |customer| csv << [customer.id, customer.name, customer.address] }
    end
  end

end
