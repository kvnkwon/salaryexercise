class Owner < Employee
  def initialize(data = {})
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
  end
end