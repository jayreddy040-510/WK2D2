require "employee"

class Startup
    attr_reader :name, :funding, :salaries
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if @salaries.keys.include?(title)
            true
        else
            false
        end
    end

    def >(diff_startup)
        self.funding > diff_startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise Exception.new
        end
    end
    
    def size
        @employees.length
    end

    def pay_employee(employee)
        if @salaries[employee.title] <= @funding 
            employee.pay(@salaries[employee.title])
            @funding = @funding - @salaries[employee.title]
        else
            raise Exception.new
        end
    end

    def payday
        @employees.each {|x| pay_employee(x)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        sum / @employees.length
    end

    def close 
        @employees = []
        @funding = 0
    end

    def acquire(diff_startup)
        @funding += diff_startup.funding
        arr = diff_startup.salaries.keys - @salaries.keys
        arr.each do |x|
            @salaries[x] = diff_startup.salaries[x]
        end
        (@employees.push(diff_startup.employees)).flatten!
        diff_startup.close
    end





end
