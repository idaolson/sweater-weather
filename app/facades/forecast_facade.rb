class ForecastFacade
  def self.get_weather(address, units)
    coords = get_coords(address)
    weather = WeatherService.get_weather_by_coords(coords.first, coords.last, units)
    Forecast.new(weather)
  end

  def self.get_coords(address)
    result = GeocodeService.get_lat_lng_by_address(address)
    coords = result[:results].first[:locations].first[:latLng]
    [coords[:lat], coords[:lng]]
  end
end
