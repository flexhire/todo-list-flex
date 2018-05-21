class Api::V1::SessionsController < ActionController::Base
  acts_as_token_authentication_handler_for User, except: [:create]

  def create
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password]) && user.save
      render json: user.to_json(only: %i[authentication_token]),
             status: :created
    else
      head :unauthorized
    end
  end

  def destroy
    user = User.find_by(authentication_token: params[:id])
    user.update!(authentication_token: nil)
    head 200
  end
end
