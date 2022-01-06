require_relative "application_controller"

class SpaceController < ApplicationController::Base
  class << self
    def call(collection)
      collection.data.each do |space|
        params = create_space_params(space)
        create(params)
      end
    end

    def fetch_all
      @spaces = Space.all
    end

    def get_available_offices
      @offices = Space.get_available_offices
    end

    def fetch_all_male_rooms
      @male_rooms = Space.get_available_male_rooms
    end

    def create(params)
      space = Space.new params
      if space
        space.save("spaces", space)
      end
    rescue => exception
      puts "An error occured: #{exception.full_message}"
    end

    def create_space_params(details, params = {})
      params["name"] = details[0]
      params["capacity"] = details[1]
      params["space_type"] = details[2]
      params["room_type"] = details[3] if details[3]
      return params
    end
  end
end
