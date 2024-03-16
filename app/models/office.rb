# frozen_string_literal: true

# offices
#
# id: unique int
# name:  string, null: false
# capacity: int, null: false

LIST = 'offices'

class Office < Base
  attr_accessor :id, :name, :capacity

  def initialize(id = nil, name:, capacity:)
    @id = id
    @name = name
    @capacity = capacity
  end

  class << self
    def storage_list
      LIST
    end

    def create(name:, capacity:)
      office = new(name: name, capacity: capacity)
      storage = StorageService.connect(storage_list)
      storage.add(office)
    end
  end
end
