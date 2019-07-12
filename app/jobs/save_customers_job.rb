class SaveCustomersJob < ApplicationJob
  queue_as :default

  def perform
    FileParser.parse.each do |data|
      customer = Customer.new(data)
      customer.save
    end
  end
end
