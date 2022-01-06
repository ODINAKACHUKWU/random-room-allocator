CONFIG_PATH = File.expand_path("../../config", __FILE__)
$LOAD_PATH.unshift(CONFIG_PATH) unless $LOAD_PATH.include?(CONFIG_PATH)

require "database"

module ApplicationModel
  class Base
    include Database
  end
end
