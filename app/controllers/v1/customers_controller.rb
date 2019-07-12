module V1
  class CustomersController < ApplicationController
    def index
      @customers = Customer.paginate(page: params[:page]).order('id')
      @customers = filter(@customers)
      render :index, status: :ok
    end

    def create
      SaveCustomersJob.perform_later
      render :create, status: :created
    end

    private

    def filter(customers)
      customers.where(filter_params)
    end

    def filter_params
      params.permit(:age, :gender, :region, :job_classification)
    end
  end
end
