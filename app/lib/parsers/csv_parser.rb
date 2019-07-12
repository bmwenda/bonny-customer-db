require 'csv'

module Parsers
  class CSVParser
    def parse
      items = []
      CSV.foreach(ENV['CSV_FILE_PATH'], headers: true, converters: :all, header_converters: :symbol) do |row|
        items << row.to_h
      end
      items
    rescue StandardError => e
      raise ExceptionHandler::FileParserError, e
    end
  end
end
