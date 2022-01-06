require_relative "application_controller"

class EmployeeController < ApplicationController::Base
  class << self
    def call(collection)
      collection.data.each do |employee|
        params = create_employee_params(employee)
        create(params)
      end
    end

    def fetch_all
      @employees = Employee.all
    end

    def fetch_all_male_fellows
      @employees.select { |employee| employee.role == "fellow" && employee.sex == "m" }
    end

    def fetch_all_female_fellows
      @employees.select { |employee| employee.role == "fellow" && employee.sex == "f" }
    end

    def create(params)
      employee = Employee.new params
      if employee
        employee.save("employees", employee)
      end
    rescue => exception
      puts "An error occured: #{exception.full_message}"
    end

    def create_employee_params(details, params = {})
      params["first_name"] = details[0]
      params["last_name"] = details[1]
      params["sex"] = details[2]
      params["role"] = details[3]
      params["require_room"] = details[4] if details[4]
      return params
    end
  end
end
