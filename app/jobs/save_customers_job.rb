class SaveCustomersJob < ApplicationJob
  queue_as :default

  def perform
    parsed_data.each do |data|
      customer = Customer.new(data)
      customer.save
    end
  end

  private

  def parsed_data
    csv_data = Parsers::CSVParser.new.parse
    excel_data = Parsers::ExcelParser.new.parse
    csv_data + excel_data
  end
end
