require_relative 'employee'
require_relative 'owner'
require_relative 'commission_sales_person'
require_relative 'quota_sales_person'
require_relative 'sales'

Employee.loadfile('employees.csv')
Sale.read_info('sale.csv')
Employee.final_output
