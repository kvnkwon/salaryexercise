require 'pry'
class QuotaSalesPerson < Employee
  def initialize(data = {})
    super(data)
    @bonus = data["bonus"].to_i
    @quota = data["quota"]
  end

  def meet_quota?
    quota_sales >= @quota.to_f
  end

  def final_payment
    if meet_quota?
      (@base_salary.to_i / 12) + @bonus
    else
      @base_salary.to_i / 12
    end
  end

  def quota_sales
    sales_person = Sale.sale_person
    sales_person[@last_name]
  end
end