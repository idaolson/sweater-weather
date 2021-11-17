class Api::V1::UsersController < ApplicationController
  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      render json: UserSerializer.new(new_user), status: :created
    else
      #error message
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
