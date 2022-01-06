require_relative "application"

class Space < ApplicationModel::Base
  attr_reader :name, :capacity, :space_type, :room_type
  attr_accessor :id, :available_space

  def initialize(space_data = {})
    @name = space_data["name"].downcase
    @capacity = space_data["capacity"].to_i
    @space_type = space_data["space_type"]
    @room_type = space_data["room_type"] if space_data["room_type"]
    calculate_available_space
  end

  class << self
    def all
      Database::Space.all
    end

    def get_available_offices
      self.all.select do |space|
        space.space_type == "office" && space.available_space > 0
      end
    end

    def get_available_male_rooms
      self.all.select do |space|
        space.room_type == "male" && space.available_space > 0
      end
    end
  end

  private

  def calculate_available_space
    @available_space = @capacity.to_i
  end

  # def add_space(space)
  #   @available_space += space
  #   @capacity += space
  # end
end
