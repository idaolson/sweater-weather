require 'rails_helper'

RSpec.describe BoredClient, :vcr do
  it 'returns results from API' do
    url = "?type=relaxation"
    result = BoredClient.fetch(url)

    expect(result).to be_a Hash
    expect(result.size).to eq(7)
    expect(result).to have_key(:activity)
    expect(result).to have_key(:type)
    expect(result).to have_key(:participants)
    expect(result).to have_key(:price)
    expect(result).to have_key(:link)
    expect(result).to have_key(:key)
    expect(result).to have_key(:accessibility)
  end
end
