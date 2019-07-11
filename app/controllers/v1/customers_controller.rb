module V1
  class CustomersController < ApplicationController
    def create
      SaveCustomersJob.perform_later
      render :create, status: :created
    end
  end
end
