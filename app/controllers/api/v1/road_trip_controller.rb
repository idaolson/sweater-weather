class Api::V1::RoadTripController < ApplicationController
  before_action :verify_api_key, only: :create

  def create

    if params[:origin].nil? || params[:destination].nil?
      render json: { error: "Missing data." }, status: :bad_request
    else
      trip_data = RoadTripFacade.get_roadtrip(params[:origin], params[:destination], params[:units] = "imperial")
      render json: RoadTripSerializer.new(trip_data)
    end
  end

  def verify_api_key
    user = User.find_by(api_key: params[:api_key])
    if !user
      render json: { error: "Unauthorized." }, status: :unauthorized
    else
      user
    end
  end
end
