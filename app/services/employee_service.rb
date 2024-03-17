# frozen_string_literal: true

class EmployeeService
  GENDER = {
    M: 'male',
    F: 'female'
  }.freeze

  attr_reader :file_paths

  def initialize(file_paths)
    @file_paths = file_paths
  end

  def self.extract_data_from(file_paths)
    new(file_paths).extract_and_save_employees
  end

  def extract_and_save_employees
    @file_paths.each do |file_path|
      puts "==> Extracting data from '#{file_path}'..."

      employees = FileService.extract_contents(file_path)
      save(employees)

      puts 'Done extracting.'
    end
  end

  private

  def save(employees)
    employees.each do |employee|
      employee_details = employee.split
      last_name = employee_details[0]
      first_name = employee_details[1]
      gender = GENDER[employee_details[2]]
      employment_category = employee_details[3]
      requires_accommodation = requires_accommodation(employee_details[4])

      Employee.create(first_name: first_name, last_name: last_name, requires_accommodation: requires_accommodation,
                      gender: gender, employment_category: employment_category)
    end
  end

  def requires_accommodation(data)
    data == 'Y'
  end
end
