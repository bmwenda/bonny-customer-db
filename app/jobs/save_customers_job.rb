class SaveCustomersJob < ApplicationJob
  queue_as :default

  def perform
    CsvParser.new.parse
  end
end
