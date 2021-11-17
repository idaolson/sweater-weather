require 'rails_helper'

RSpec.describe "Activities endpoint", :vcr do
  before :each do
    @destination = "chicago,il" # 51 degress here
    @destination2 = "san antonio,tx" # 69 degress here
    @destination3 = "fairbanks,ak" # -1 degress here
  end


  it "returns the destination, forecast, and two recommended activites--one based on current temp" do
    get "/api/v1/activities?destination=#{@destination}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('activities')
    expect(result[:data][:attributes][:destination]).to eq(@destination)
    expect(result[:data][:attributes][:forecast]).to be_a(Hash)
    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(result[:data][:attributes][:forecast]).to_not have_key(:sunrise)
    expect(result[:data][:attributes][:activities]).to be_a(Hash)
    expect(result[:data][:attributes][:activities].count).to eq(2)
    activities = result[:data][:attributes][:activities]
    activities.each do |activity|
      expect(activity.first.to_s).to be_a String
      expect(activity.last).to have_key(:type)
      expect(activity.last[:type]).to_not eq("recreational")
      expect(activity.last[:type]).to_not eq("cooking")
      expect(activity.last).to have_key(:participants)
      expect(activity.last).to have_key(:price)
      expect(activity.last).to_not have_key(:accessibility)
    end

    get "/api/v1/activities?destination=#{@destination2}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('activities')
    expect(result[:data][:attributes][:destination]).to eq(@destination2)
    expect(result[:data][:attributes][:forecast]).to be_a(Hash)
    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(result[:data][:attributes][:forecast]).to_not have_key(:sunrise)
    expect(result[:data][:attributes][:activities]).to be_a(Hash)
    expect(result[:data][:attributes][:activities].count).to eq(2)
    activities = result[:data][:attributes][:activities]
    activities.each do |activity|
      expect(activity.first.to_s).to be_a String
      expect(activity.last).to have_key(:type)
      expect(activity.last[:type]).to_not eq("cooking")
      expect(activity.last[:type]).to_not eq("busywork")
      expect(activity.last).to have_key(:participants)
      expect(activity.last).to have_key(:price)
      expect(activity.last).to_not have_key(:accessibility)
    end

    get "/api/v1/activities?destination=#{@destination3}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('activities')
    expect(result[:data][:attributes][:destination]).to eq(@destination3)
    expect(result[:data][:attributes][:forecast]).to be_a(Hash)
    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(result[:data][:attributes][:forecast]).to_not have_key(:sunrise)
    expect(result[:data][:attributes][:activities]).to be_a(Hash)
    expect(result[:data][:attributes][:activities].count).to eq(2)
    activities = result[:data][:attributes][:activities]
    activities.each do |activity|
      expect(activity.first.to_s).to be_a String
      expect(activity.last).to have_key(:type)
      expect(activity.last[:type]).to_not eq("recreational")
      expect(activity.last[:type]).to_not eq("busywork")
      expect(activity.last).to have_key(:participants)
      expect(activity.last).to have_key(:price)
      expect(activity.last).to_not have_key(:accessibility)
    end
  end
end
