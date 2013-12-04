require 'csv'
require 'pry'
class Sale

  @@sales_info = []
  @@sales_person = {}
  def initialize(sales = {})
    @last_name = sales['last_name']
    @amount = sales['gross_sale_value']
  end

  def self.read_info(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      sales = row.to_hash
      @@sales_info << sales
    end
    sales_per_person
  end

  def self.sales_per_person
    @@sales_info.each do |hash|
      if !@@sales_person.include?(hash['last_name'])
        @@sales_person[hash['last_name']] = hash['gross_sale_value'].to_i
      else
        @@sales_person[hash['last_name']] += hash['gross_sale_value'].to_i
      end
    end
  end

  def self.sale_person
    @@sales_person
  end

  def self.total_gross_sale
    total_sale = []
    @@sales_person.each do |key, value|
      total_sale << value.to_i
    end
    total_sale.inject(:+)
  end
end


