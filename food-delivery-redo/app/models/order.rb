class Order
  attr_reader :meal, :customer, :employee, :delivered
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end

  def delivered!
    @delivered = true
  end
end
