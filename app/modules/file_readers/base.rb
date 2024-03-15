# frozen_string_literal: true

module FileReaders
  class Base
    def self.read(file_path)
      raise NotImplementedError, "Subclasses must implement the 'read' method"
    end
  end
end
