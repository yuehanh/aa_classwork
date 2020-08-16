require 'employee'
require 'byebug'

class Startup
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  attr_reader :name, :funding, :salaries, :employees
  attr_writer :funding

  def valid_title?(title)
    salaries.key?(title)
  end

  def >(other_startup)
    funding > other_startup.funding
  end

  def hire(name, title)
    raise 'BIG ERROR' unless valid_title?(title)

    employees << Employee.new(name, title)
  end

  def size
    employees.length
  end

  def pay_employee(employee)
    if funding >= salaries[employee.title]
      employee.pay(salaries[employee.title])
      self.funding -= salaries[employee.title] # @why do we have use @ here
    else
      raise 'NOT ENOUGH FUNDING'
    end
  end

  def payday
    employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    arr = employees.map { |employee| salaries[employee.title] }
    (arr.sum * 1.0) / arr.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup_2)
    @funding += startup_2.funding
    (startup_2.salaries.keys - salaries.keys).each { |title| salaries[title] = startup_2.salaries[title] }
    @employees += startup_2.employees
    startup_2.close
end
end
