module V1
  class CustomersController < ApplicationController
    def create
      SaveCustomersJob.perform_later
      render json: { message: 'Customers saved' }, status: :ok
    end
  end
end
