# frozen_string_literal: true

# offices
#
# id: unique int
# first_name:  string, null: false
# last_name:  string, null: false
# gender: string, null: false
# employment_category: string, null: false
# requires_accommodation: boolean, null: false, dafault: false

class Employee < Base
  LIST = 'employees'

  attr_accessor :id, :first_name, :last_name, :gender, :employment_category, :requires_accommodation

  def initialize(id = nil, requires_accommodation:, first_name:, last_name:, gender:, employment_category:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @gender = gender
    @employment_category = employment_category
    @requires_accommodation = requires_accommodation
  end

  def self.storage_list
    LIST
  end
end
