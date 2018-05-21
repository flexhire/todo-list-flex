class Api::V1::UsersController < Api::ApplicationController
  before_action :authenticate
  before_action :set_user, only: %i[show edit update destroy status]

  def index
    render json: User.all.map(&:serialize)
  end

  def show
    render json: @user.serialize, status: 201
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user.serialize, status: 201
    else
      invalid_error(@user)
    end
  end

  def update
    if @user.update(user_params)
      render json: @user.serialize, status: 201
    else
      invalid_error(@user)
    end
  end

  def destroy
    @user.destroy
    render status: 201
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :confirm_password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
