require 'csv'

class CsvParser
  def parse
    CSV.foreach(ENV['CSV_FILE_PATH'], headers: true) do |row|
      customer_params = customer_hash(row.to_h)
      customer = Customer.new(customer_params)
      customer.save
    end
  rescue StandardError => e
    raise ExceptionHandler::FileParserError, e
  end

  private

  def customer_hash(row_hash)
    row_hash.transform_keys { |key| key.downcase.gsub(' ', '_') }
  end
end
