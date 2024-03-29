# frozen_string_literal: true

APP_ROOT = File.expand_path('..', __dir__)
APP_DIRECTORY = File.expand_path('.', __dir__)
APP_FOLDER = APP_DIRECTORY.split('/').last
APP_NAME = APP_FOLDER.split('-').map(&:capitalize).join(' ')
INPUT_FILES_PATH = 'files'
EMPLOYEES_INPUT_FILE = Dir['files/employees.{txt,json,csv}']
FEMALE_ROOMS_INPUT_FILE = Dir['files/female_rooms.{txt,json,csv}']
MALE_ROOMS_INPUT_FILE = Dir['files/male_rooms.{txt,json,csv}']
OFFICES_INPUT_FILE = Dir['files/offices.{txt,json,csv}']
