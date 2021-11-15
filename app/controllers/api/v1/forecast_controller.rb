class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.get_weather(params[:location], params[:units] = "imperial")
    # need sad path
    render json: ForecastSerializer.new(forecast)
  end
end