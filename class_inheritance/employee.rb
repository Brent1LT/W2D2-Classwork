class Employee 
  attr_reader :salary 
  
  def initialize(name, title, salary, boss)
    @name = name 
    @title = title 
    @salary = salary 
    @boss = boss 
  end 

  def bonus(multiplier) 
    @salary * multiplier 
  end 
end 

class Manager < Employee 
  attr_writer :employees 

  def initialize(name, title, salary, boss) 
    super 
    @employees = [] 
  end 

  def bonus(multiplier) 
    total = 0 
    @employees.each do |worker|
      if worker.is_a?(Manager) 
        total += worker.bonus(multiplier) + (worker.salary * multiplier) 
      else 
        total += worker.bonus(multiplier) 
      end 
    end 
    total 
  end 
end 

ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
darren = Manager.new('Darren', 'TA Manager', 78_000, 'Ned')
shawna = Employee.new('Shawna', 'TA', 12_000, 'Darren')
david = Employee.new('David', 'TA', 10_000, 'Darren')

ned.employees = [darren] 
darren.employees = [shawna, david] 

p ned.bonus(5) # => 500_000 
p darren.bonus(4) # => 88_000 
p david.bonus(3) # => 30_000 