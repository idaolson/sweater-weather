class Api::V1::ActivitiesController < ApplicationController
  def show
    activities = ForecastFacade.get_activities(params[:location], params[:units] = "imperial")

    render json: BoredSerializer.new(activities)
  end
end
