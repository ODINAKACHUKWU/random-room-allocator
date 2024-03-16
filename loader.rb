# frozen_string_literal: true

# Global
require 'json'
require 'pry'

require_relative 'contants'
require_relative 'app/allocator'

# Services
require_relative 'app/services/file_service'
require_relative 'app/services/room_service'
require_relative 'app/services/storage_service'
require_relative 'app/services/office_service'

# Classes
require_relative 'app/classes/errors/missing_input_folder_error'

# Modules
require_relative 'app/modules/file_readers/base'
require_relative 'app/modules/file_readers/text'
require_relative 'app/modules/file_readers/json'
require_relative 'app/modules/file_readers/csv'

# Models
require_relative 'app/models/base'
require_relative 'app/models/room'
require_relative 'app/models/office'
require_relative 'app/models/employee'
