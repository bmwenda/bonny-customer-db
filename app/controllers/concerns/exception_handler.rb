module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from AuthenticationError, with: :unauthenticated
    rescue_from MissingToken, with: :bad_request
  end

  private

  def unauthenticated(error)
    render json: { message: error.message }, status: :unauthorized
  end

  def not_found(error)
    render json: { message: error.message }, status: :not_found
  end

  def bad_request(error)
    render json: { message: error.message }, status: :bad_request
  end
end
