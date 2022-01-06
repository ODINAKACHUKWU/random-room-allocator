MODEL_PATH = File.expand_path("../../models", __FILE__)
$LOAD_PATH.unshift(MODEL_PATH) unless $LOAD_PATH.include?(MODEL_PATH)
require "employee"
require "space"

module ApplicationController
  class Base
  end
end
