class Owner < Employee
  def initialize(data = {})
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
  end

  def self.meet_quota
    Sale.total_gross_sale >= 250000
  end

  def self.gross_salary
    if meet_quota?
      (@base_salary.to_i / 12) + 1000
    else
      @base_salary.to_i / 12
    end
  end
end