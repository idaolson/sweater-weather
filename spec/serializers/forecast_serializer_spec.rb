# require 'rails_helper'
#
# RSpec.describe ForecastSerializer do
#   it "serializes forecast data" do
#     forecast = ForecastFacade.get_weather("denver,co", params[:units] = "imperial")
#     # render json: ForecastSerializer.new(forecast)
#
#     serializer = ForecastSerializer.new(forecast).serializable_hash
#     require "pry"; binding.pry
#     expect(serializer).to have_key(:data)
#     expect(serializer[:data]).to have_key(:id)
#     expect(serializer[:data]).to have_key(:type)
#     expect(serializer[:data]).to have_key(:attributes)
#     expect(serializer[:data][:attributes]).to have_key(:current_weather)
#     expect(serializer[:data][:attributes]).to have_key(:daily_weather)
#     expect(serializer[:data][:attributes]).to have_key(:hourly_weather)
#   end
# end
