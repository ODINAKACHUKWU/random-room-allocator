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
          file.write(JSON.generate([]))
          puts "> #{file_path} added."
        end
      end
    end

    def add_to_storage(file_path, data)
      list = get_list_from_storage(file_path)
      add_data_to_list(list, data)
      add_list_to_storage(file_path, list)
      data
    end

    private

    def assign_unique_id_to_data(list, data)
      data.id = list.length + 1
    end

    def add_list_to_storage(file_path, list)
      File.open(file_path, 'w') do |file|
        file.write(convert_list_to_json(list))
      end
    end

    def get_list_from_storage(file_path)
      JSON.parse(File.read(file_path))
    end

    def add_data_to_list(list, data)
      assign_unique_id_to_data(list, data)
      list << data
    end

    def convert_list_to_json(list)
      JSON.pretty_generate(list)
    end
  end
end
