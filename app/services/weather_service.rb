class WeatherService
  def self.get_weather_by_coords(lat, lon, units)
      url = "?lat=#{lat}&lon=#{lon}&units=#{units}"
      WeatherClient.fetch(url)
  end
end
