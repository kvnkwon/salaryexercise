require 'pry'
class CommissionSalesPerson < Employee
  def initialize(data = {})
    super(data)
    @commission = data["commission"]
  end

  def gross_sales
    sales_person = Sale.sale_person
    sales_person[@last_name] * @commission.to_f
  end

  def final_payment
    (@base_salary.to_i / 12) + gross_sales
  end
end
