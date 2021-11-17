require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  it 'returns result from get_forecast' do
    location = "chicago,il"
    result = ImageFacade.get_background(location)

    expect(result).to be_an Image
  end
end
