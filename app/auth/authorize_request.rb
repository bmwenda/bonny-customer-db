class AuthorizeRequest
  def initialize(headers = {})
    @headers = headers
  end

  def current_user
    user
  end

  private

  attr_reader :headers

  def decoded_token
    @decoded_token ||= JwtHandler.decode(token)
  end

  def user
    @user ||= User.find(decoded_token[:user_id])
  rescue ActiveRecord::RecordNotFound
    raise ExceptionHandler::AuthenticationError, 'Invalid token'
  end

  def token
    if headers['Authorization'].present?
      @token ||= headers['Authorization'].split(' ').last
    else
      raise ExceptionHandler::MissingToken, 'Token not set'
    end
  end
end
