require 'rails_helper'

RSpec.describe "RoadTrip endpoint", :vcr do
  before :each do
    @user = User.create!({
                    "email": "ida@gmail.com",
                    "password": "cassio",
                    "password_confirmation": "cassio"
                  })

    @start = "Cheyenne,WY"
    @end = "McAllen,TX"

  end

  it 'returns start and ending locations, duration of trip in hours and minutes, and weather conditions at end' do
    body = {
      "start_city": @start,
      "end_city": @end,
      "api_key": @user.api_key
    }

    post '/api/v1/road_trip', params: body, as: :json

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(result).to be_a(Hash)
    expect(result[:data]).to be_a(Hash)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('road_trip')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes].size).to eq(4)
    expect(result[:data][:attributes]).to have_key(:start_city)
    expect(result[:data][:attributes]).to have_key(:end_city)
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes]).to have_key(:weather_at_eta)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
  end
end
