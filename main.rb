require_relative 'employee'
require_relative 'owner'
require_relative 'commission_sales_person'
require_relative 'quota_sales_person'
require_relative 'sales'

Employee.loadfile('employees.csv')
Sale.read_info('sale.csv')
# puts Employee.commission_sales.first.gross_sales
# puts Employee.commission_sales.first.gross_salary
# puts Employee.quota_sales.first.first_name
# puts Employee.quota_sales.first.meet_quota?
# puts Employee.quota_sales.first.gross_salary
# puts Employee.owners.first.gross_salary



Employee.final_output

