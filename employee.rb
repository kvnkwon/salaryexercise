require 'pry'
require 'csv'

class Employee

  attr_reader :first_name, :last_name, :base_salary

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

  def self.owners
    @@all_employees.select do |employee|
      employee.class == Owner
    end
  end

  def self.commission_sales
    @@all_employees.select do |employee|
      employee.class == CommissionSalesPerson
    end
  end

  def self.quota_sales
    @@all_employees.select do |employee|
      employee.class == QuotaSalesPerson
    end
  end

  def gross_salary
    @base_salary.to_i / 12
  end

  def final_payment
    gross_salary
  end

  def tax
    final_payment.to_f * 0.30
  end

  def net_pay
    final_payment - tax
  end

  def self.final_output
    @@all_employees.each do |employee|
      puts "***#{employee.first_name} #{employee.last_name}***"
      puts "Gross Salary: $#{employee.gross_salary}"

      puts "Net Pay: $#{employee.net_pay}"
      puts "***"
      binding.pry
    end
  end

end



