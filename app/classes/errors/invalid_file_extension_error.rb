# frozen_string_literal: true

module Errors
  class InvalidFileExtensionError < StandardError
    def initialize(msg = 'The input file has an invalid extension.')
      super
    end
  end
end
