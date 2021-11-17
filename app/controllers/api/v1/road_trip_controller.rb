class Api::V1::RoadTripController < ApplicationController
  before_action :verify_api_key, only: :create

  def create
    trip_data = RoadTripFacade.get_roadtrip(params[:start_city], params[:end_city], params[:units] = "imperial")
    render json: RoadTripSerializer.new(trip_data)
  end

  def verify_api_key
    user = User.find_by(api_key: params[:api_key])
    unauthorized unless user
  end
end
