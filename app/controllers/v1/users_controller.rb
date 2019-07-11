module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      @user = User.new(user_params)
      if @user.save
        token = AuthenticateUser.new(@user.username, @user.password).generate_token
        render json: { token: token }, status: :created
      else
        render json: {
          message: { errors: @user.errors.full_messages }
        }, status: :unprocessable_entity
      end
    end

    def show
      render json: user
    end

    private

    def user
      @user ||= User.find(params[:id])
    end

    def user_params
      params.permit(
        :name,
        :username,
        :email,
        :password
      )
    end
  end
end
