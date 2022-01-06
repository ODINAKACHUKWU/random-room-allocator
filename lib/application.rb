module Application
  class Base
    class << self
      def fetch_file_content(file)
        Extractor.extract_file_content(file)
      end
    end
  end
end

class App < Application::Base
end
