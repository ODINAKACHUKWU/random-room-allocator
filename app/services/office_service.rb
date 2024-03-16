# frozen_string_literal: true

class OfficeService
  def initialize(file_paths)
    @file_paths = file_paths
  end

  class << self
    def extract_data_from(file_paths)
      new(file_paths).extract_and_save_rooms
    end
  end

  def extract_and_save_rooms
    @file_paths.each do |file_path|
      puts "==> Extracting data from '#{file_path}'..."

      offices = FileService.extract_contents(file_path)
      save(offices)

      puts 'Done extracting.'
    end
  end

  private

  def save(offices)
    offices.each do |office|
      name = office.split(' ').first
      capacity = office.split(' ').last.to_i

      Office.create(name: name, capacity: capacity)
    end
  end
end
