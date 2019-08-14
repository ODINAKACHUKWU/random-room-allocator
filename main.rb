require "pry-byebug"
require "json"
require_relative "helpers/allocation_helpers"
require_relative "helpers/file_reader_helpers"
require_relative "helpers/response_helpers"

# Steps:
# -> Get all data from files and store the data obtained in arrays of objects (employees, offices, and rooms respectively)
# -> Assign all employees (staff and fellows) to available offices
# -> Assign all fellows (male and female) to available rooms
# -> Send JSON responses to allocations folder

class RandomRoomAllocator
  include AllocationHelper
  include FileReaderHelper
  include ResponseHelper
  @@employees = []
  @@office_spaces = []
  @@male_rooms = []
  @@female_rooms = []

  # This method allocates all employees to available offices
  def allocate_employees
    loop do
      break if unallocated_employees?(@@employees).length == 0 || available_office_space?(@@office_spaces).length == 0
      office = @@office_spaces.sample
      @@employees.each do |employee|
        if employee.office_space.nil? && office["available_space"] >= 1
          employee.office_space = (office["office"])
          office["available_space"] -= 1
        end
      end
    end
  end

  # This method allocates all fellows who require accommodation to available rooms
  def allocate_fellows
    male_fellows = @@employees.select do |employee|
      employee.sex == "M" && employee.role == "FELLOW" && employee.accommodation? == "Y"
    end

    female_fellows = @@employees.select do |employee|
      employee.sex == "F" && employee.role == "FELLOW" && employee.accommodation? == "Y"
    end

    fellows = [male_fellows, female_fellows]

    fellows.each do |fellows|
      loop do
        rooms = [@@male_rooms, @@female_rooms]
        break if unallocated_fellows?(fellows).length == 0 || available_room_space?(fellows, rooms).length == 0

        fellows.sample.sex == "M" ? room = rooms[0].sample : room = rooms[1].sample

        fellows.each do |fellow|
          if fellow.room.nil? && room["available_space"] >= 1
            fellow.room = (room["room"])
            room["available_space"] -= 1
          end
        end
      end
    end
  end

  # This method executes all allocations and returns all required json responses
  def allocate_all
    files = [["files/employees.txt", @@employees], ["files/offices.txt", @@office_spaces], ["files/male_rooms.txt", @@male_rooms], ["files/female_rooms.txt", @@female_rooms]]
    if read_files(files) == "No file match!"
      puts "Oops! Allocation was not successful. Please ensure that every file has an all-letters capitalized title!"
    else
      puts "Files successfully read!"
      puts "allocating offices to employees..."
      puts ".................................."
      allocate_employees
      puts "allocating rooms to fellows..."
      allocate_fellows
      puts ".................................."
      puts "Allocations successfull!"
      send_office_allocation(@@employees)
      send_male_room_allocation(@@employees)
      send_female_room_allocation(@@employees)
      send_unallocated_employees(@@employees)
      send_unallocated_fellows(@@employees)
    end
  end
end

random_room_allocator = RandomRoomAllocator.new
random_room_allocator.allocate_all
