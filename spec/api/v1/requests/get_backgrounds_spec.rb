require 'rails_helper'

RSpec.describe "Backgrounds endpoint", :vcr do
  before :each do
    @location = "chicago,il" # 51 degress here
    @location2 = "san antonio,tx" # 69 degress here
    @location3 = "fairbanks,ak" # -1 degress here
  end


  it 'returns random background image of location based on weather conditions and time of day' do
    get "/api/v1/backgrounds?location=#{@location}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result).to be_a(Hash)
    expect(result[:data]).to be_a(Hash)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq('image')
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:location)
    expect(result[:data][:attributes]).to have_key(:image_url)
    expect(result[:data][:attributes]).to have_key(:source)
    expect(result[:data][:attributes]).to have_key(:author)
    expect(result[:data][:attributes]).to have_key(:author_url)
    expect(result[:data][:attributes]).to_not have_key(:description)
    expect(result[:data][:attributes]).to_not have_key(:likes)
  end
end
