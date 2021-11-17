require 'rails_helper'

RSpec.describe WeatherClient, :vcr do
  it 'returns results from Open Weather API' do
    lat = 41.883229
    lon = -87.632398
    units = "imperial"
    url = "?lat=#{lat}&lon=#{lon}&units=#{units}"
    result = WeatherClient.fetch(url)

    expect(result).to be_a Hash
    expect(result.size).to eq(8)
    expect(result).to have_key(:current)
    expect(result).to have_key(:hourly)
    expect(result).to have_key(:daily)
  end
end
