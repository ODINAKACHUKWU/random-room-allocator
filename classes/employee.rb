class Employee

    def initialize(first_name, last_name, sex, role, accommodation)
        @first_name = first_name.capitalize
        @last_name = last_name.capitalize
        @name = "#{@first_name} #{@last_name}"
        @sex = sex
        @role = role
        @accommodation = accommodation
    end

    def first_name
        @first_name
    end

    def last_name
        @last_name
    end

    def name
        @name
    end

    def sex
        @sex
    end

    def role
        @role
    end

    def accommodation?
        @accommodation
    end

    def office_space
        @office
    end

    def office_space=(office)
        @office = office
    end

    def room
        @room
    end

    def room=(room)
        @room = room
    end

end
