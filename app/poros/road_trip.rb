class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(start, destination, duration, weather)
    @start_city = start
    @end_city = destination
    @travel_time = format_duration(duration)
    @weather_at_eta = weather
  end

  def format_duration(duration)
    "#{duration[:hours]} hours, #{duration[:minutes]} minutes"
  end
end
