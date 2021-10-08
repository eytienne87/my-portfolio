class Order

  attr_reader :meal, :customer, :employee
  attr_accessor :id

  def inititalize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end
end
