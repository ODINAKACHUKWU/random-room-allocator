# frozen_string_literal: true

class Base
  attr_reader :file_paths

  def initialize(file_paths)
    @file_paths = file_paths
  end

  def self.extract_data_from(file_paths, *args)
    new(file_paths, *args).extract_and_save_data
  end

  def extract_and_save_data
    @file_paths.each do |file_path|
      puts "==> Extracting data from '#{file_path}'..."

      data = FileService.extract_contents(file_path)
      save(data)

      puts 'Done extracting.'
    end
  end

  private

  def save(data)
    raise NotImplementedError, 'Implement the save method in subclasses'
  end
end
