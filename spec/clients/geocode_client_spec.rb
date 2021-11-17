require 'rails_helper'

RSpec.describe GeocodeClient, :vcr do
  it 'returns results from Geocode API' do
    address = "chicago,il"
    url = "?location=#{address}"
    result = GeocodeClient.fetch(url)

    expect(result).to be_a Hash
    expect(result.size).to eq(3)
    expect(result).to have_key(:results)
    expect(result[:results].first).to have_key(:locations)
    expect(result[:results].first[:locations].first).to have_key(:latLng)
  end
end
