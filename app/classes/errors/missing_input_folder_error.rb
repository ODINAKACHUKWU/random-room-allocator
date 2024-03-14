module Errors
  class MissingInputFolderError < StandardError
    def initialize(msg = "The folder containing input files is missing.")
      super
    end
  end
end
