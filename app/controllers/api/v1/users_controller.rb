class Api::V1::UsersController < ApplicationController
  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: "Missing data." }, status: :bad_request
    elsif User.find_by(email: new_user.email)
      render json: { error: "Email in use." }, status: :bad_request
    elsif params[:password] != params[:password_confirmation]
      render json: { error: "Passwords do not match." }, status: :bad_request
    elsif new_user.save
      render json: UserSerializer.new(new_user), status: :created
    else
      render json: { error: "Invalid request." }, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
