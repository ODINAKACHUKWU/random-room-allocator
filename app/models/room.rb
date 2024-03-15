# frozen_string_literal: true

# rooms
#
# id: unique int
# name:  string, null: false
# gender_category: string, null: false
# capacity: int, null: false

TABLE = 'rooms'

class Room < Base
  attr_accessor :id, :name, :gender_category, :capacity

  def initialize(id = nil, name:, gender_category:, capacity:)
    @id = id
    @name = name
    @gender_category = gender_category
    @capacity = capacity
    @storage = StorageService.new(TABLE)
  end

  class << self
    def table_name
      TABLE
    end

    def create(name:, gender_category:, capacity:)
      new(name: name, gender_category: gender_category, capacity: capacity)
    end
  end
end
