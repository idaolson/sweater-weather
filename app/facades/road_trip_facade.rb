class RoadTripFacade
  def self.get_roadtrip(start, destination, units = "imperial")
    route_data = RouteService.get_route(start, destination)
    duration = secs_to_hrs(route_data[:route][:time])
    weather = forecast_upon_arrival(destination, duration, units)

    roadtrip = RoadTrip.new(start, destination, duration, weather)
  end

  def self.secs_to_hrs(seconds)
    { hours: seconds / (60 * 60), minutes: (seconds / 60) % 60 }
  end

  def self.forecast_upon_arrival(destination, duration, units)
    lat_long = GeocodeService.get_lat_lng_by_address(destination)[:results].first[:locations].first[:latLng]
    weather = WeatherService.get_weather_by_coords(lat_long[:lat], lat_long[:lng], units)
    {
      temperature: temp_arrival_time(weather, duration),
      conditions: cond_arrival_time(weather, duration)
    }
  end

  def self.temp_arrival_time(weather, duration)
    if duration[:hours] > 48
      weather[:daily][(duration[:hours] / 24)][:temp][:day]
    else
      weather[:hourly][duration[:hours]][:temp]
    end
  end

  def self.cond_arrival_time(weather, duration)
    if duration[:hours] > 48
      weather[:daily][(duration[:hours] / 24)][:weather].first[:description]
    else
      weather[:hourly][duration[:hours]][:weather].first[:description]
    end
  end
end
