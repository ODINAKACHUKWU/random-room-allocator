# frozen_string_literal: true

require_relative 'loader'

puts '==> Setting up temporary storage...'

StorageService.setup

puts '==> Setup completed.'

puts "==> Starting #{APP_NAME} app..."

Allocator.run

puts '==> App executed sucessfully.'
