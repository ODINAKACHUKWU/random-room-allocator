require_relative "application"

class Employee < ApplicationModel::Base
  attr_reader :first_name, :last_name, :sex, :role, :require_room
  attr_accessor :id, :office, :room

  def initialize(employee_data = {})
    @first_name = employee_data["first_name"].downcase
    @last_name = employee_data["last_name"].downcase
    @sex = employee_data["sex"].downcase
    @role = employee_data["role"].downcase
    @require_room = employee_data["require_room"].downcase if employee_data["require_room"]
    @office = nil
    @room = nil
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  class << self
    def all
      Database::Employee.all
    end
  end
end
