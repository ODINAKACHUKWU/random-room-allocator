# frozen_string_literal: true

STORAGE_FOLDER = 'tmp'
LISTS = %w[employees rooms offices].freeze

class StorageService
  def initialize(list)
    @@list = list
  end

  class << self
    def setup
      create_storage
      create_storage_lists
    end

    def connect(list)
      new(list)
      self
    end

    def add(data)
      FileService.add_to_storage(file_path, data)
    end

    private

    def file_path
      File.join(STORAGE_FOLDER, "#{@@list}.json")
    end

    def create_storage
      FileService.create_storage(path: STORAGE_FOLDER)
    end

    def create_storage_lists
      FileService.create_storage_lists(lists: LISTS, path: STORAGE_FOLDER)
    end
  end
end
