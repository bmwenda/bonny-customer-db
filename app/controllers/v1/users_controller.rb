module V1
  class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
      @user = User.new(user_params)
      if @user.save
        @token = AuthenticateUser.new(@user.username, @user.password).generate_token
        render :create, status: :created
      else
        render :create, status: :unprocessable_entity
      end
    end

    def show
      @user ||= User.find(params[:id])
      render :show, status: :ok
    end

    private

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
