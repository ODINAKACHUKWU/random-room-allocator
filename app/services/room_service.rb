# frozen_string_literal: true

class RoomService < Base
  attr_reader :gender_category

  def initialize(file_paths, gender_category)
    super(file_paths)
    @gender_category = gender_category
  end

  def save(rooms)
    rooms.each do |room|
      name, capacity = room.split(' ')
      Room.create(name: name, capacity: capacity.to_i, gender_category: @gender_category)
    end
  end
end
