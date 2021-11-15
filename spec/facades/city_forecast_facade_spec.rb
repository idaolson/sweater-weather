require 'rails_helper'

RSpec.describe CityForecastFacade do
  it "gets the coordinates of a location" do
    coords =  CityForecastFacade.city_coords("Denver,CO")
    expect(coords).to be_a(Hash)
    # expect(hazards.count).to eq(4)
    # expect(hazards.first).to be_a(Hazard)
  end
end
