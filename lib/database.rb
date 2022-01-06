require "sqlite3"

module Storage
  class Database
    class << self
      def open(database)
        begin
          SQLite3::Database.new database
        rescue SQLite3::Exception => exception
          puts "An error occurred: #{exception}"
        end
      end
    end
  end

  class Migration
    def create_table
    end

    def remove_table
    end
  end

  class Schema
    def define
    end
  end
end
