require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do
  it 'returns result from get_coordinates' do
    origin = "Cheyenne,WY"
    destination = "South Hadley,MA"

    result = RoadTripFacade.get_roadtrip(origin, destination)

    expect(result).to be_a RoadTrip
  end
end
