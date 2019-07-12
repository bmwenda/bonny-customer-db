require 'spreadsheet'

module Parsers
  class ExcelParser
    def parse
      book = Spreadsheet.open(ENV.fetch('EXCEL_FILE_PATH'))
      sheet = book.worksheets.first
      headers = %w[customer_id name surname gender age region job_classification date_joined balance]
      items = []
      sheet.each 1 do |row|
        customer_params = headers.zip(row).to_h
        items << customer_params
      end
      items
    rescue StandardError => e
      raise ExceptionHandler::FileParserError, e
    end
  end
end
