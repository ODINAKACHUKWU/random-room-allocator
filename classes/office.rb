class Office

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @available_space = capacity
    end

    def name
        @name
    end

    def capacity
        @capacity
    end

    def available_space
        @available_space
    end

    def add_space(space)
        @available_space += space
        @capacity += space
    end

    def available_space=(available_space)
        @available_space = available_space
    end

end

office = Office.new("Ruby", 6)
puts office.name
puts office.capacity
puts office.available_space
office.add_space(3)
puts office.name
puts office::capacity
puts office::available_space
puts office::available_space=(7)
puts office.name
puts office::capacity
puts office::available_space
