# frozen_string_literal: true

# offices
#
# id: unique int
# name:  string, null: false
# gender: string, null: false
# employment_category: string, null: false
# requires_accommodation: boolean, null: false, dafault: false

class Employee < Base
  LIST = 'employees'

  attr_accessor :id, :name, :gender, :employment_category, :requires_accommodation

  def initialize(id = nil, name:, gender:, employment_category:, requires_accommodation:)
    @id = id
    @name = name
    @gender = gender
    @employment_category = gender
    @requires_accommodation = requires_accommodation
  end

  def self.storage_list
    LIST
  end
end
