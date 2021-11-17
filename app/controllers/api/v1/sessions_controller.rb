class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: :ok
    else
      render json: { error: "Invalid credentials." }, status: :bad_request
    end
  end
end
