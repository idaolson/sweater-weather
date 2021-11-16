class Api::V1::ActivitiesController < ApplicationController
  def show
    activities = ForecastFacade.get_bored(params[:destination], params[:units] = "imperial")

    render json: ActivitySerializer.new(activities)
  end
end
