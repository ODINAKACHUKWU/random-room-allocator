# frozen_string_literal: true

class OfficeService < Base
  def save(offices)
    offices.each do |office|
      name, capacity = office.split(' ')
      Office.create(name: name, capacity: capacity.to_i)
    end
  end
end
