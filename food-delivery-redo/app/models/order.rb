class Order
  attr_reader :meal, :customer, :employee, :delivered
  attr_accessor :id

  def inititalize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end
end
