class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorize_request

  def heartbeat
    render json: { status: :ok }
  end

  def authorize_request
    @current_user = AuthorizeRequest.new(request.headers).current_user
  end
end
