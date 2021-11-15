class ForecastFacade
  def self.city_weather(address, units)
    coords = city_coords(address)
    result = WeatherService.get_weather_by_coords(coords.first, coords.last, units)

  end


  def self.city_coords(address)
    result = GeocodeService.get_lat_lng_by_address(address)
    coords = result[:results].first[:locations].first[:latLng]
    [coords[:lat], coords[:lng]]
    require "pry"; binding.pry
  end
end
