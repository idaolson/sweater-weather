class ForecastFacade
  def self.get_weather(address, units = "imperial")
    coords = get_coords(address)
    weather = WeatherService.get_weather_by_coords(coords.first, coords.last, units)
    Forecast.new(weather)
  end

  def self.get_coords(address)
    result = GeocodeService.get_lat_lng_by_address(address)
    coords = result[:results].first[:locations].first[:latLng]
    [coords[:lat], coords[:lng]]
  end

  def self.get_bored(address, units)
    forecast = get_weather(address, units)

    relax_activity = BoredService.find_relaxation_activity
    temp_activity = BoredService.find_activity_by_temp(forecast.current_weather[:temperature])
    Activity.new(address, forecast.current_weather, relax_activity, temp_activity)
  end
end
