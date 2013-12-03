class CommissionSalesPerson < Employee
  def initialize(data = {})
    super(data)
    @commission = data["commission"]
  end
end