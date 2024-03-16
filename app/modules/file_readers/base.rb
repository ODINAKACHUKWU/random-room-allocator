# frozen_string_literal: true

module FileReaders
  class Base
    def self.read(file_path)
      File.open(file_path, 'r') do |content|
        File.readlines(content)
      end
    end
  end
end
