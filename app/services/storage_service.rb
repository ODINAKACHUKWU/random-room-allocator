# frozen_string_literal: true

STORAGE_FOLDER = 'tmp'
LISTS = %w[employees rooms offices].freeze

class StorageService
  def initialize(table)
    @table = table
  end

  def connect; end

  class << self
    def setup
      create_storage
      create_storage_lists
    end

    private

    def create_storage
      FileService.create_storage(path: STORAGE_FOLDER)
    end

    def create_storage_lists
      FileService.create_storage_lists(lists: LISTS, path: STORAGE_FOLDER)
    end
  end
end
