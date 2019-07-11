module V1
  class CustomersController < ApplicationController
    def create
      CsvParser.new.parse
    end
  end
end
