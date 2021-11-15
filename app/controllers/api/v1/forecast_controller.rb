class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.get_forecast(params[:location], params[:units])
    # need sad path
    render json: ForecastSerializer.new(forecast)
  end
end
