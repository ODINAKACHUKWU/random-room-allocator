# frozen_string_literal: true

# rooms
#
# id: unique int
# name:  string, null: false
# gender_category: string, null: false
# capacity: int, null: false

class Room < Base
  LIST = 'rooms'

  attr_accessor :id, :name, :gender_category, :capacity

  def initialize(id = nil, name:, gender_category:, capacity:)
    @id = id
    @name = name
    @gender_category = gender_category
    @capacity = capacity
  end

  class << self
    def storage_list
      LIST
    end

    def create(name:, gender_category:, capacity:)
      room = new(name: name, gender_category: gender_category, capacity: capacity)
      storage = StorageService.connect(storage_list)
      storage.add(room)
    end
  end
end
