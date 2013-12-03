require 'pry'
class CommissionSalesPerson < Employee
  def initialize(data = {})
    super(data)
    @commission = data["commission"]
  end

  def self.gross_sales
    @@sales_person = Sale.sales_per_person
    @@sales_person[@last_name] * @commission
    binding.pry
  end

  def gross_salary
    (@base_salary.to_i / 12) + gross_sales
  end

end
