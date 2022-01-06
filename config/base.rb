# Enable running the application in different environments.
# Set `development` as default environment.
ENV['ENVIRONMENT'] ||= 'development'

MODELS_PATH = File.expand_path '../app/models', __dir__
CONTROLLERS_PATH = File.expand_path '../app/controllers', __dir__

APP_PATHS = [MODELS_PATH, CONTROLLERS_PATH]

APP_PATHS.each { |path| $LOAD_PATH.unshift path unless $LOAD_PATH.include? path }

puts $LOAD_PATH

# require 'pg'
require 'active_record'
require 'dotenv'

require 'employee'

require_relative 'database'

Dotenv.load(".env.#{ENV.fetch('ENVIRONMENT')}.local", ".env.#{ENV.fetch('ENVIRONMENT')}", '.env')

# Create a connection between activerecord and postgres
# using the `establish_connection` method
ActiveRecord::Base.establish_connection(Database.db_configuration[ENV['ENVIRONMENT']])

module Config
  class Base
  end
end
