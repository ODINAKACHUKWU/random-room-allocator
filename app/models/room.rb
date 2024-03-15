# frozen_string_literal: true

# rooms
#
# id: unique int
# name:  string, null: false
# gender_category: string, null: false
# capacity: int, null: false

LIST = 'rooms'

class Room < Base
  attr_accessor :id, :name, :gender_category, :capacity

  def initialize(id = nil, name:, gender_category:, capacity:)
    @id = id
    @name = name
    @gender_category = gender_category
    @capacity = capacity
  end

  class << self
    def table_name
      LIST
    end

    def create(name:, gender_category:, capacity:)
      room = new(name: name, gender_category: gender_category, capacity: capacity)

      storage = StorageService.connect(LIST)
      storage.add(room)
    end
  end
end
