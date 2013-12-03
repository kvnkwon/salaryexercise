require 'pry'
require 'csv'

class Employee

  @@all_employees = []

  def initialize(data = {})
    @first_name = data["first_name"]
    @last_name = data["last_name"]
    @base_salary = data["base_salary"]
  end

  def self.loadfile(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      data = row.to_hash
      if ['developer', 'designer'].include?(data["role"])
        @@all_employees << Employee.new(data)
      elsif ['commission sales person'].include?(data["role"])
        @@all_employees << CommissionSalesPerson.new(data)
      elsif ['quota sales person'].include?(data["role"])
        @@all_employees << QuotaSalesPerson.new(data)
      elsif ['owner'].include?(data["role"])
        @@all_employees << Owner.new(data)
      end
    end
  end

  def monthly_salary
    @base_salary.to_i / 12
  end

  def tax
    monthly_salary.to_f * 0.30
  end

  def net_pay
    monthly_salary - tax
  end
end



