# frozen_string_literal: true

module ResponseHelper
  # Formats the data (allocated employees) for JSON response
  def get_employees_allocation(employees)
    employees_list = []
    employees.each do |employee|
      employee_data = {}
      employee_data['name'] = employee.name
      employee_data['office_space'] = employee.office_space
      employees_list.push employee_data
    end
    employees_list
  end

  # Formats the data (allocated fellows) for JSON response
  def get_fellows_room_allocation(fellows)
    fellows_list = []
    fellows.each do |fellow|
      fellow_data = {}
      fellow_data['name'] = fellow.name
      fellow_data['room'] = fellow.room
      fellows_list.push fellow_data
    end
    fellows_list
  end

  # Formats the data (unallocated employees) for JSON response
  def get_unallocated_employees(employees)
    employees_list = []
    employees.each do |employee|
      employees_list.push employee.name
    end
    employees_list
  end

  # Formats the data (unallocated fellows) for JSON response
  def get_unallocated_fellows(fellows)
    fellows_list = []
    fellows.each do |fellow|
      fellows_list.push fellow.name
    end
    fellows_list
  end

  # Sends all employees that have been allocated to offices into a JSON file in the allocations folder
  def send_office_allocation(employees)
    allocated_employees = employees.reject do |employee|
      employee.office_space.nil?
    end

    response = {}
    if allocated_employees
      data = get_employees_allocation(allocated_employees)
      response['message'] = 'These employees have been allocated to available offices!'
      response['total'] = data.length
      response['data'] = data
      json = response.to_json
      office_allocation = File.new('allocations/office_space_allocation.json', 'w')
      office_allocation.puts json
      office_allocation.close
      puts "Please check the file 'allocations/office_space_allocation.json' to view all office allocations!"
    else
      response['message'] = 'No employee has been allocated to an office!'
      json = response.to_json
      office_allocation = File.new('allocations/office_space_allocation.json', 'w')
      office_allocation.puts json
      office_allocation.close
      puts "No employee has been allocated to an office! You may view the file 'allocations/office_space_allocation.json'"
    end
  end

  # Fetches all allocated male fellows
  def send_male_room_allocation(employees)
    allocated_male_fellows = employees.select do |employee|
      employee.sex == 'M' && !employee.room.nil?
    end

    response = {}
    if allocated_male_fellows
      data = get_fellows_room_allocation(allocated_male_fellows)
      response['message'] = 'These male fellows have been allocated to available rooms!'
      response['total'] = data.length
      response['data'] = data
      json = response.to_json
      male_room_allocation = File.new('allocations/male_room_allocation.json', 'w')
      male_room_allocation.puts json
      male_room_allocation.close
      puts "Please check the file 'allocations/male_room_allocation.json' to view all male room allocations!"
    else
      response['message'] = 'No male fellow has been allocated to a room!'
      json = response.to_json
      male_room_allocation = File.new('allocations/male_room_allocation.json', 'w')
      male_room_allocation.puts json
      male_room_allocation.close
      puts "No male has been allocated to a room! You may view the file 'allocations/male_room_allocation.json'"
    end
  end

  # Fetches all allocated female fellows
  def send_female_room_allocation(employees)
    allocated_female_fellows = employees.select do |employee|
      employee.sex == 'F' && !employee.room.nil?
    end

    response = {}
    if allocated_female_fellows
      data = get_fellows_room_allocation(allocated_female_fellows)
      response['message'] = 'These female fellows have been allocated to available rooms!'
      response['total'] = data.length
      response['data'] = data
      json = response.to_json
      female_room_allocation = File.new('allocations/female_room_allocation.json', 'w')
      female_room_allocation.puts json
      female_room_allocation.close
      puts "Please check the file 'allocations/female_room_allocation.json' to view all female room allocations!"
    else
      response['message'] = 'No female fellow has been allocated to a room!'
      json = response.to_json
      female_room_allocation = File.new('allocations/female_room_allocation.json', 'w')
      female_room_allocation.puts json
      female_room_allocation.close
      puts "No female has been allocated to a room! You may view the file 'allocations/female_room_allocation.json'"
    end
  end

  # Fetches all employees without office allocation
  def send_unallocated_employees(employees)
    unallocated_employees = employees.select do |employee|
      employee.office_space.nil?
    end

    response = {}
    if unallocated_employees
      data = get_unallocated_employees(unallocated_employees)
      response['message'] = 'These employees have not been allocated due to insufficient office space!'
      response['total'] = data.length
      response['data'] = data
      json = response.to_json
      unallocated_employees = File.new('allocations/unallocated_employees.json', 'w')
      unallocated_employees.puts json
      unallocated_employees.close
      puts "Please check the file 'allocations/unallocated_employees.json' to view all unallocated employees!"
    else
      response['message'] = 'All employees have been allocated!'
      json = response.to_json
      unallocated_employees = File.new('allocations/unallocated_employees.json', 'w')
      unallocated_employees.puts json
      unallocated_employees.close
      puts "All employees have been allocated! You may view the file 'allocations/female_room_allocation.json'"
    end
  end

  # Fetches all fellows without room allocation
  def send_unallocated_fellows(employees)
    unallocated_fellows = employees.select do |employee|
      employee.role == 'FELLOW' && employee.accommodation? == 'Y' && employee.room.nil?
    end

    response = {}
    if unallocated_fellows
      data = get_unallocated_fellows(unallocated_fellows)
      response['message'] = 'These fellows have not been allocated due to insufficient rooms!'
      response['total'] = data.length
      response['data'] = data
      json = response.to_json
      unallocated_fellows = File.new('allocations/unallocated_fellows.json', 'w')
      unallocated_fellows.puts json
      unallocated_fellows.close
      puts "Please check the file 'allocations/unallocated_fellows.json' to view all unallocated employees!"
    else
      response['message'] = 'All fellows have been allocated!'
      json = response.to_json
      unallocated_employees = File.new('allocations/unallocated_fellows.json', 'w')
      unallocated_employees.puts json
      unallocated_employees.close
      puts "All fellows have been allocated! You may view the file 'allocations/unallocated_fellows.json'"
    end
  end
end
