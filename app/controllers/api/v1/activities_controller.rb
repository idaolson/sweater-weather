class Api::V1::ActivitiesController < ApplicationController
  def show
    activities = ForecastFacade.get_bored(params[:destination], params[:units] = "imperial")

    render json: BoredSerializer.new(activities)
  end
end
