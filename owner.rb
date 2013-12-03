require 'pry'
class Owner < Employee
  def initialize(data = {})
    super(data)
    @bonus = data["bonus"]
    @quota = data["quota"]
  end

  def meet_quota?
    Sale.total_gross_sale >= @quota.to_f
  end

  def gross_salary
    if meet_quota?
      (@base_salary.to_i / 12) + @bonus.to_i
    else
      @base_salary.to_i / 12
    end
  end
end