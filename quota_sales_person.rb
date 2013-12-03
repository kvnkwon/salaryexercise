class QuotaSalesPerson < Employee
  def initialize(data = {})
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
  end
end