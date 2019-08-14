class Room

    def initialize(name, capacity, room_type)
        @name = name
        @capacity = capacity
        @available_space = capacity
        @room_type = room_type
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

    def room_type
        @room_type
    end

    def add_space(space)
        @available_space += space
        @capacity += space
    end

    def available_space=(available_space)
        @available_space = available_space
    end

end
