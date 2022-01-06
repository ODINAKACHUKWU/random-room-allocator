require 'yaml'
require 'erb'

class Database
  def self.db_configuration
    # The method returns the path to the file with the database configuration
    db_configuration_file_path = File.join(File.expand_path('..', __dir__), 'db', 'config.yml')

    # Having the path to the file, we can read its values. Because the config.yml file contains environment variables
    # accessed in the erb <%= %> syntax, we need to use the `erb` gem. Without this, the values of the variables will not be read correctly and activerecord will not be able to connect to postgres. 
    
    # The method will returns the configuration as a string.     
    db_configuration_result = ERB.new(File.read(db_configuration_file_path)).result
        
    # Using the `yaml` gem, we can safely load the configuration  
    YAML.safe_load(db_configuration_result, aliases: true)
  end
end
