# frozen_string_literal: true

class FileService
  class << self
    def extract_contents(file_path)
      ext = File.extname(file_path)

      case ext
      when '.txt'
        FileReaders::Text.read(file_path)
      when '.csv'
        FileReaders::CSV.read(file_path)
      when '.json'
        FileReaders::JSON.read(file_path)
      else
        raise Errors::InvalidFileExtensionError
      end
    end

    def create_storage(path:)
      Dir.mkdir(path) unless File.directory?(path)
    end

    def create_storage_lists(lists:, path:)
      lists.each do |list|
        file_path = File.join(path, "#{list}.json")

        File.open(file_path, 'w') do |file|
          file.write JSON.generate([])
          puts "> #{file_path} added."
        end
      end
    end

    def add_to_file(file_path, data)
      list = JSON.parse(File.read(file_path))

      # Assign unique id to the data before pushing into the list
      data.id = list.length + 1

      # Push data into the list
      list << data

      # Convert list back to json
      json_data = JSON.pretty_generate(list)

      # Write the json data to the file
      File.open(file_path, 'w') do |file|
        file.write(json_data)
      end

      data
    end
  end
end
