require 'byebug'

class Employee
  attr_accessor :name, :title, :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss&.add_subordinates(self)
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @subordinates = []
  end

  def add_subordinates(person)
    @subordinates << person
  end

  def bonus(multiplier)
    salaries = subordinates.map do |subordinate|
      if subordinate.is_a?(Manager)
        subordinate.salary * multiplier + subordinate.bonus(multiplier)
      else
        subordinate.bonus(multiplier)
      end
    end
    salaries.sum
  end
end

ned = Manager.new('ned', 'Founder', 1_000_000, nil)
darren = Manager.new('darren', 'TA Manager', 78_000, ned)
shawna = Employee.new('shawna', 'TA', 12_000, darren)
david = Employee.new('david', 'TA', 10_000, darren)

# debugger
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
