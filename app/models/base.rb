# frozen_string_literal: true

class Base
  class << self
    def find; end

    def where; end

    def storage_list
      raise NotImplementedError, 'Subclasses must implement storage_list method'
    end

    def create(**attributes)
      item = new(**attributes)
      storage = StorageService.connect(storage_list)
      storage.add(item)
    end
  end
end
