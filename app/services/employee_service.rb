# frozen_string_literal: true

class EmployeeService < Base
  GENDER = { 'M' => 'male', 'F' => 'female' }.freeze

  def save(employees)
    employees.each do |employee|
      last_name, first_name, gender_code, employment_category, requires_accommodation = employee.split
      gender = GENDER[gender_code]
      requires_accommodation = requires_accommodation == 'Y'

      Employee.create(first_name: first_name, last_name: last_name, requires_accommodation: requires_accommodation,
                      gender: gender, employment_category: employment_category)
    end
  end
end
