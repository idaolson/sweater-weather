class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(weather)
    @current_weather = get_current(weather[:current])
    @daily_weather = get_daily(weather[:daily])
    @hourly_weather = get_hourly(weather[:hourly])
  end

  def get_current(data)
    {
      datetime: Time.at(data[:dt]).getlocal,
      sunrise: Time.at(data[:sunrise]).getlocal,
      sunset: Time.at(data[:sunset]).getlocal,
      temperature: data[:temp],
      feels_like: data[:feels_like],
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather].first[:description],
      icon: data[:weather].first[:icon]
    }
  end

  def get_daily(data)
    data.drop(1).take(5).map do |day|
      {
        date: Time.at(day[:dt]).getlocal.strftime('%Y-%m-%d'),
        sunrise: Time.at(day[:sunrise]).getlocal,
        sunset: Time.at(day[:sunset]).getlocal,
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def get_hourly(data)
    data.drop(1).take(8).map do |hour|
      {
        time: Time.at(hour[:dt]).getlocal.strftime('%I:%M:%S'),
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end
end
