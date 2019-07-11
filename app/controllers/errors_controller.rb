class ErrorsController < ApplicationController
  def path_not_found
    render json: { message: 'Path not found' }, status: :not_found
  end
end
