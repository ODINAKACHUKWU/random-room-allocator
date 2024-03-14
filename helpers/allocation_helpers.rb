# frozen_string_literal: true

module AllocationHelper
  # This method returns an array of employees that have not been allocated to offices
  def unallocated_employees?(employees)
    # binding.pry

    employees.select do |employee|
      # employee["office_space"] == nil
      employee.office_space.nil?
      # binding.pry
    end
  end

  # This method checks whether there are available offices for employees to be allocated
  def available_office_space?(offices)
    offices.select do |office|
      (office['available_space']).positive?
    end
  end

  # This method returns an fellows that have not been allocated to rooms
  def unallocated_fellows?(fellows)
    fellows.select do |fellow|
      fellow.room.nil?
    end
  end

  # This method checks whether there are available rooms for fellows to be allocated
  def available_room_space?(fellows, rooms)
    rooms = fellows.sample.sex == 'M' ? rooms[0] : rooms[1]
    rooms.select do |room|
      (room['available_space']).positive?
    end
  end
end
