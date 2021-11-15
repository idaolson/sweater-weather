require 'rails_helper'

RSpec.describe ForecastFacade do
  it "returns the coordinates of a location in an array" do
    coords = ForecastFacade.get_coords("Denver,CO")
    expect(coords).to be_an Array
    expect(coords.length).to eq(2)
  end

  it "gets the weather at a set of coordinates" do
    weather = ForecastFacade.get_weather("Denver,CO", "imperial")
    expect(weather).to be_a Forecast
  end
end
