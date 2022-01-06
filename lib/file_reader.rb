module FileReader
    # [TODO]: ensure that any employee/space which has already been added to the collection is not added again.
  class Extractor
    # @@employees    = []
    # @@offices      = []
    # @@male_rooms   = []
    # @@female_rooms = []

    class << self
      def extract_file_content(**file)
        # begin
        #   file_title = get_file_title(file)
        #   file_data  = get_file_data(file)
        #   file_data.each do |data|
        #     split = data.split(" ")
        #     case file_title
        #     when "EMPLOYEES\n"
        #       employee = generate_employee_hash(split)
        #       @@employees.push employee
        #     when "FEMALE ROOMS\n"
        #       space = generate_space_hash(split)
        #       @@female_rooms.push space
        #     when "MALE ROOMS\n"
        #       space = generate_space_hash(split)
        #       @@male_rooms.push space
        #     when "OFFICES\n"
        #       space = generate_space_hash(split)
        #       @@offices.push space
        #     end
        #   end
        #   response = generate_return_object(@@employees, @@offices, @@male_rooms, @@female_rooms)
        #   return response
        # rescue => exception
        #   puts "An error occured: #{exception}."
        # end

        # begin
        #   file_title = get_file_title(file)
        #   file_data = get_file_data(file)
        #     case file_title
        #     when "EMPLOYEES\n"
        #       file_data.each do |data|
        #         split = data.split(" ")
        #         add_to_collection(split, @@employees)
        #       rescue => exception
        #         puts "An error occured: #{exception}."
        #       end
        #       collection = generate_return_object("offices", @@offices)
        #       return collection
        #     when "FEMALE ROOMS\n"
        #       file_data.each do |data|
        #         split = data.split(" ")
        #         add_to_collection(split, @@female_rooms)
        #       rescue => exception
        #         puts "An error occured: #{exception}."
        #       end
        #       generate_return_object("offices", @@offices)
        #     when "MALE ROOMS\n"
        #       file_data.each do |data|
        #         split = data.split(" ")
        #         add_to_collection(split, @@male_rooms)
        #       rescue => exception
        #         puts "An error occured: #{exception}."
        #       end
        #       generate_return_object("offices", @@offices)
        #     when "OFFICES\n"
        #       file_data.each do |data|
        #         split = data.split(" ")
        #         add_to_collection(split, @@offices)
        #       rescue => exception
        #         puts "An error occured: #{exception}."
        #       end
        #       generate_return_object("offices", @@offices)
        #     end
        # end

        begin
          file.each do |title, path|
            file_data = get_file_data(path)
            data = file_data.map(&:downcase)
            result = convert(title, data)
            return result
          end
        rescue => exception
          puts "An error occured: #{exception}"
        end
      end

      private

      # def generate_return_object(name, collection)
      #   return_object = {
      #     name => collection,
      #   }
      #   return return_object
      # end

      # def generate_return_object(employees, offices, male_rooms, female_rooms)
      #   return_object = {
      #     "employees" => employees,
      #     "offices" => offices,
      #     "male_rooms" => male_rooms,
      #     "female_rooms" => female_rooms,
      #   }
      #   return return_object
      # end

      # def get_file_title(file)
      #   File.open(file, &:readline)
      # end
      def convert(title, data, file = {})
        file[title] = data
        return file
      end

      def get_file_data(file)
        File.readlines(file)
      end

      # def generate_employee_hash(split, hash = {}, collection)
      #   hash["first_name"]   = split[0].downcase
      #   hash["last_name"]    = split[1].downcase
      #   hash["sex"]          = split[2].downcase
      #   hash["role"]         = split[3].downcase
      #   hash["require_room"] = split[4].downcase if split[4]
      #   return hash
      # end

      # def add_to_collection(split, hash = {}, collection)
      #   hash["first_name"]   = split[0].downcase
      #   hash["last_name"]    = split[1].downcase
      #   hash["sex"]          = split[2].downcase
      #   hash["role"]         = split[3].downcase
      #   hash["require_room"] = split[4].downcase if split[4]        
      #   collection.push hash
      #   return collection
      # end

      # def generate_space_hash(split, hash = {})
      #   hash["space"]           = split[0].downcase
      #   hash["capacity"]        = split[1].to_i
      #   hash["available_space"] = split[1].to_i
      #   return hash
      # end
    end
  end
end

class Extractor < FileReader::Extractor
end
