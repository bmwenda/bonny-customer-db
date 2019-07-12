module V1
  class CustomersController < ApplicationController
    def index
      @customers = Customer.paginate(page: params[:page]).order('id')
      render :index, status: :ok
    end

    def create
      SaveCustomersJob.perform_later
      render :create, status: :created
    end
  end
end
