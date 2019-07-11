require 'csv'

class CsvParser
  def parse
    CSV.foreach(ENV['CSV_FILE_PATH'], headers: true, converters: :all, header_converters: :symbol) do |row|
      customer = Customer.new(row.to_h)
      if customer.save
        # Trigger mailchimp to add customer to subscription
      else
        # Some error occured, skip saving
        next
      end
    end
  rescue StandardError => e
    raise ExceptionHandler::FileParserError, e
  end
end
