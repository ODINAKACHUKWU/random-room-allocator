# frozen_string_literal: true

class RoomService
  attr_reader :file_paths

  def initialize(file_paths, gender_category)
    @file_paths = file_paths
    @gender_category = gender_category
  end

  class << self
    def extract_data_from(file_paths, gender_category)
      new(file_paths, gender_category).extract_and_save_rooms
    end
  end

  def extract_and_save_rooms
    @file_paths.each do |file_path|
      puts "==> Extracting data from '#{file_path}'"

      rooms = FileService.extract_contents(file_path)
      save(rooms)
    end
  end

  private

  def save(rooms)
    rooms.each do |room|
      name = room.split(' ').first
      capacity = room.split(' ').last.to_i

      p '----- room', Room.create(name: name, capacity: capacity, gender_category: @gender_category)
    end
  end
end
