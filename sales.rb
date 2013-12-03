require 'csv'
require 'pry'
class Sale

  @@sales_info = []
  def initialize(sales = {})
    @last_name = sales['last_name']
    @amount = sales['gross_sale_value']
  end

  def self.read_info(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      sales = row.to_hash
      @@sales_info << sales
    end
  end

  def total_gross_sale
  end

end
