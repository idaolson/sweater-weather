require 'rails_helper'

RSpec.describe UnsplashClient, :vcr do
  it 'returns results from Unsplash API' do
    query = "chicago,il overcast clouds night"
    url = "?query=#{query}"
    result = UnsplashClient.fetch(url)

    expect(result).to be_a Hash
    expect(result.size).to eq(3)
    expect(result[:results].first).to have_key(:urls)
    expect(result[:results].first).to have_key(:user)
    expect(result[:results].first[:user]).to have_key(:name)
    expect(result[:results].first[:user]).to have_key(:links)
  end
end
