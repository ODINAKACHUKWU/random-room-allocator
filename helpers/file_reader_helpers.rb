# frozen_string_literal: true

require './classes/employee'

module FileReaderHelper
  def read_files(files)
    puts 'Please wait! Reading files...'
    puts '.............................'
    files.each do |file|
      file_type = File.open(file[0], &:readline)
      case file_type
      when "EMPLOYEES\n"
        File.readlines(file[0]).drop(2).each do |line|
          split = line.split(' ')
          accommodation = split[4] ? (split[4]).to_s : 'N/A'
          employee = Employee.new(split[0], split[1], split[2], split[3], accommodation)
          file[1].push employee
        end
      when "OFFICES\n"
        File.readlines(file[0]).drop(2).each do |line|
          split = line.split(' ')
          capacity = {}
          capacity['office'] = split[0]
          capacity['capacity'] = split[1].to_i
          capacity['available_space'] = split[1].to_i
          file[1].push capacity
        end
      when "MALE ROOMS\n"
        File.readlines(file[0]).drop(2).each do |line|
          split = line.split(' ')
          capacity = {}
          capacity['room'] = split[0]
          capacity['capacity'] = split[1].to_i
          capacity['available_space'] = split[1].to_i
          file[1].push capacity
        end
      when "FEMALE ROOMS\n"
        File.readlines(file[0]).drop(2).each do |line|
          split = line.split(' ')
          capacity = {}
          capacity['room'] = split[0]
          capacity['capacity'] = split[1].to_i
          capacity['available_space'] = split[1].to_i
          file[1].push capacity
        end
      else
        return 'No file match!'
      end
    end
  end
end
