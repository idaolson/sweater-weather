require 'rails_helper'

RSpec.describe "Forecast endpoint", :vcr do
  before :each do
    @location = "chicago,il" # 51 degress here
    @location2 = "san antonio,tx" # 69 degress here
    @location3 = "fairbanks,ak" # -1 degress here
  end

  it 'returns the forecast for a specific location' do
    get "/api/v1/forecast?location=#{@location}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
    expect(result[:data]).to be_a(Hash)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('forecast')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes].size).to eq(3)
    expect(result[:data][:attributes]).to_not have_key(:minutely)

    expect(result[:data][:attributes]).to have_key(:current_weather)
    expect(result[:data][:attributes][:current_weather].size).to eq(10)
    expect(result[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(result[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(result[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(result[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(result[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(result[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(result[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(result[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(result[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(result[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(result[:data][:attributes][:current_weather]).to_not have_key(:dew_point)

    expect(result[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(result[:data][:attributes][:daily_weather].length).to eq(5)
    expect(result[:data][:attributes][:daily_weather].first).to be_a(Hash)
    expect(result[:data][:attributes][:daily_weather].first.size).to eq(7)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:date)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:sunset)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:conditions)
    expect(result[:data][:attributes][:daily_weather].first).to have_key(:icon)
    expect(result[:data][:attributes][:daily_weather].first).to_not have_key(:moonrise)
    expect(result[:data][:attributes][:daily_weather].first).to_not have_key(:moonset)

    expect(result[:data][:attributes][:hourly_weather]).to be_an(Array)
    expect(result[:data][:attributes][:hourly_weather].length).to eq(8)
    expect(result[:data][:attributes][:hourly_weather].first).to be_a(Hash)
    expect(result[:data][:attributes][:hourly_weather].first.size).to eq(4)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:time)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:temperature)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
    expect(result[:data][:attributes][:hourly_weather].first).to have_key(:icon)
    expect(result[:data][:attributes][:hourly_weather].first).to_not have_key(:feels_like)
  end
end
