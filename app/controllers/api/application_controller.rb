class Api::ApplicationController < ApplicationController

  def authenticate
    unauthorized_error unless authenticate_by_header
  end

  # Returns the current user on successful authentication
  # @return [User, Nil]
  def current_user
    @current_user
  end

  # Sets the current user from headers
  # Expects authorization header in this format:
  #   Authorization: Bearer WCZZYjnOQFUYfJIN2ShH1iD24UHo58A6TI
  # @return [Boolean]
  def authenticate_by_header
    return false if request.authorization.blank?

    token, _ = ActionController::HttpAuthentication::Token.token_and_options(request)

    @current_user = User.where.not(authentication_token: nil).find_by(authentication_token: token)
  end

  private
  def unauthorized_error
    self.headers["WWW-Authenticate"] = %(Token realm="Application")
    error('Unauthorized', "No valid API key provided.", 401)
  end

  # @param e [ActiveRecord::RecordInvalid]
  def invalid_error(e)
    error('RecordInvalid', e.record.errors.to_hash, 422)
  end

  # @param e [StandardError]
  def internal_server_error(e)
    error('InternalServerError', "Sorry, there is a problem on our side.")
  end

  # @param code [String]
  # @param message [String, Hash]
  # @param status [Integer]
  def error(code, message, status=500)
    render json: { code: code, error: message }, status: status
  end
end
