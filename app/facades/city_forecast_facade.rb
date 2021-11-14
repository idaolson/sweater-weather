class CityForecastFacade
  def self.city_coords(address)
    result = GeocodeService.get_lat_lng_by_address(address)
    coords = result[:results].first[:locations].first[:latLng]
  end

  
end

#
# class ScoreFacade
#   class << self
#     def walk_safety_info(attrs)
#       result = WalkScoreService.walk_score_by_location(attrs)
#       Score.new(result)
#     end
#   end
# end
#
# def self.get_forecast(location, units = 'imperial')
#   geocode = GeocodeService.lat_long(location)
#   if geocode.instance_of?(Error)
#     geocode
#   else
#     lat_long = geocode[:results].first[:locations].first[:latLng]
#     lat = lat_long[:lat]
#     long = lat_long[:lng]
#     weather = WeatherService.forecast(lat, long, units)
#     Forecast.new(weather)
#   end
# end
