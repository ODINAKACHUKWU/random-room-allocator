# frozen_string_literal: true

# offices
#
# id: unique int
# name:  string, null: false
# capacity: int, null: false

class Office < Base
  LIST = 'offices'

  attr_accessor :id, :name, :capacity

  def initialize(id = nil, name:, capacity:)
    @id = id
    @name = name
    @capacity = capacity
  end

  def self.storage_list
    LIST
  end
end
