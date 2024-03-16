# frozen_string_literal: true

# require_relative "helpers/allocation_helpers"
# require_relative "lib/file_reader"
# require_relative "lib/application"
# require_relative "db/setup"
# require_relative "controllers/application_controller"
# require "pry-byebug"
# require_relative "helpers/response_helpers"

# class Applicatio
#   # include AllocationHelper
#   # include FileReaderHelper
#   # include ResponseHelper
#   # @@employees = []
#   # @@office_spaces = []
#   # @@male_rooms = []
#   # @@female_rooms = []

#   # This method allocates all employees to available offices
#   def allocate_employees
#     loop do
#       break if unallocated_employees?(@@employees).length == 0 || available_office_space?(@@office_spaces).length == 0
#       office = @@office_spaces.sample
#       @@employees.each do |employee|
#         if employee.office_space.nil? && office["available_space"] >= 1
#           employee.office_space = (office["office"])
#           office["available_space"] -= 1
#         end
#       end
#     end
#   end

#   # This method allocates all fellows who require accommodation to available rooms
#   def allocate_fellows
#     male_fellows = @@employees.select do |employee|
#       employee.sex == "M" && employee.role == "FELLOW" && employee.accommodation? == "Y"
#     end

#     female_fellows = @@employees.select do |employee|
#       employee.sex == "F" && employee.role == "FELLOW" && employee.accommodation? == "Y"
#     end

#     fellows = [male_fellows, female_fellows]

#     fellows.each do |fellows|
#       loop do
#         rooms = [@@male_rooms, @@female_rooms]
#         break if unallocated_fellows?(fellows).length == 0 || available_room_space?(fellows, rooms).length == 0

#         fellows.sample.sex == "M" ? room = rooms[0].sample : room = rooms[1].sample

#         fellows.each do |fellow|
#           if fellow.room.nil? && room["available_space"] >= 1
#             fellow.room = (room["room"])
#             room["available_space"] -= 1
#           end
#         end
#       end
#     end
#   end

#   # This method executes all allocations and returns all required json responses
#   def self.allocate_all

#     # files = [["files/employees.txt", @@employees], ["files/offices.txt", @@office_spaces], ["files/male_rooms.txt", @@male_rooms], ["files/female_rooms.txt", @@female_rooms]]
#     # if read_files(files) == "No file match!"
#     #   puts "Oops! Allocation was not successful. Please ensure that every file has an all-letters capitalized title!"
#     # else
#     #   puts "Files successfully read!"
#     #   puts "allocating offices to employees..."
#     #   puts ".................................."
#     #   allocate_employees
#     #   puts "allocating rooms to fellows..."
#     #   allocate_fellows
#     #   puts ".................................."
#     #   puts "Allocations successfull!"
#     #   send_office_allocation(@@employees)
#     #   send_male_room_allocation(@@employees)
#     #   send_female_room_allocation(@@employees)
#     #   send_unallocated_employees(@@employees)
#     #   send_unallocated_fellows(@@employees)
#     # end
#   end
# end

# # ======================= Start of the app

# class Collection
#   attr_reader :data

#   def initialize(data = [])
#     @data = data
#   end
# end

# # require_relative "models/employee"
# require_relative "controllers/employee_controller"
# require_relative "controllers/space_controller"

# # [TODO]: Write code to verify whether a file is empty in order to return a clear response message to the user that the file is empty.

# class RandomAllocator
#   attr_reader :allocations

#   def initialize(allocations = [])
#     @allocations = allocations
#   end

#   def analyze_file(*files)
#     files.each do |file|
#       title = file.split("/").last.split(".").first
#       begin
#         case title
#         when "employees"
#           # Call the employee controller
#           collection = Collection.new
#           File.open(file).each do |line|
#             data = line.chomp.split
#             collection.data.push data
#           end
#           EmployeeController.call(collection)
#         when "offices"
#           # Call the space controller
#           collection = Collection.new
#           File.open(file).each do |line|
#             data = line.chomp.split
#             data.push "office"
#             collection.data.push data
#           end
#           SpaceController.call(collection)
#         when "male_rooms"
#           # Call the space controller
#           collection = Collection.new
#           File.open(file).each do |line|
#             data = line.chomp.split
#             data.push "room"
#             data.push "male"
#             collection.data.push data
#           end
#           SpaceController.call(collection)
#         when "female_rooms"
#           # Call the space controller
#           collection = Collection.new
#           File.open(file).each do |line|
#             data = line.chomp.split
#             data.push "room"
#             data.push "female"
#             collection.data.push data
#           end
#           SpaceController.call(collection)
#         else
#           unsuported_file = file.split("/").last
#           puts "The file '#{unsuported_file}' is not supported!"
#         end
#       rescue => exception
#         puts "An error occured: #{exception.full_message}"
#       end
#     end
#   end

#   def get_all_employees
#     EmployeeController.fetch_all
#   end

#   def get_all_male_fellows
#     EmployeeController.fetch_all_male_fellows
#   end

#   def get_all_female_fellows
#     EmployeeController.fetch_all_female_fellows
#   end

#   def get_all_spaces
#     SpaceController.fetch_all
#   end

#   def get_male_rooms
#     SpaceController.fetch_all_male_rooms
#   end

#   def get_female_rooms
#     SpaceController.fetch_all_female_rooms
#   end

#   def get_available_offices
#     SpaceController.get_available_offices
#   end

#   def allocate_offices_to_employees
#     employees = get_all_employees
#     offices = get_available_offices
#     allocate(employees, offices)
#     # p ">>>>>>", employees
#   end

#   def allocate_rooms_to_fellows
#     allocate_rooms_to_male_fellows
#     # allocate_rooms_to_female_fellows
#   end

#   private

#   def allocate_rooms_to_male_fellows
#     @male_fellows = get_all_male_fellows
#     @rooms = get_male_rooms
#     allocate(@male_fellows, @rooms)
#   end

#   def allocate_rooms_to_female_fellows
#     @male_fellows = get_all_female_fellows
#     @rooms = get_female_rooms
#   end

#   def allocate(employees, spaces)
#     loop do
#       if unallocated_employees?(employees) && available_space?(spaces)
#         employees.each do |employee|
#           space = spaces.sample
#           employee.office = space.name
#           space.available_space -= 1
#         end
#       else
#         break
#       end
#     end
#   end

#   def unallocated_employees?(employees)
#     employees.select { |employee| employee.office == nil }.any?
#   end

#   def available_space?(spaces)
#     spaces.select { |space| space.available_space > 0 }.any?
#   end
# end

# app = RandomAllocator.new
# app.analyze_file("files/employees.txt", "files/offices.txt", "files/male_rooms.txt", "files/female_rooms.txt", "files/file.txt")

# app.allocate_offices_to_employees
# app.allocate_rooms_to_fellows
# p ">>>>>", app.get_all_employees
# require_relative 'validations/allocator_validations'

class Allocator
  def initialize(output_type = 'json')
    output_type
  end

  def self.run
    new.run
  end

  def run
    # Steps:
    # -> Check presence of 'files' folder
    validate_presence_of_input_files_path

    # -> Read the input files
    puts '==> Reading input files...'
    all_input_files = EMPLOYEES_INPUT_FILE + OFFICES_INPUT_FILE + FEMALE_ROOMS_INPUT_FILE + MALE_ROOMS_INPUT_FILE
    puts '==> Valid input files to read: ', all_input_files.uniq.sort

    RoomService.extract_data_from(FEMALE_ROOMS_INPUT_FILE, 'female')
    RoomService.extract_data_from(MALE_ROOMS_INPUT_FILE, 'male')
    OfficeService.extract_data_from(OFFICES_INPUT_FILE)

    # -> Get all data from files and store the data obtained in arrays of objects (employees, offices, and rooms respectively)
    # -> Assign all employees (staff and fellows) to available offices
    # -> Assign all fellows (male and female) to available rooms
    # -> Send JSON responses to allocations folder
  end

  private

  def validate_presence_of_input_files_path
    raise Errors::MissingInputFolderError unless File.directory?(INPUT_FILES_PATH)
  end
end
