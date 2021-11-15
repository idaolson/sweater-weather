class Forecast
  attr_reader :current_weather, :daily_weather, :hourly_weather

  def initialize(weather)
    @current_weather = get_current(weather[:current])
    @daily_weather = get_hourly(weather[:hourly])
    @hourly_weather = get_daily(weather[:daily])
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
  # {
  #            "dt": 1636945200,
  #            "sunrise": 1636897431,
  #            "sunset": 1636933514,
  #            "temp": 57.45,
  #            "feels_like": 54.5,
  #            "humidity": 34,
  #            "uvi": 0,
  #            "visibility": 10000,
  #            "weather": [
  #                {
  #                    "description": "clear sky",
  #                    "icon": "01n"
  #                }
  #            ],
  #        },
#   datetime, in a human-readable format such as “2020-09-30 13:27:03 -0600”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# temperature, floating point number indicating the current temperature in Fahrenheit
# feels_like, floating point number indicating a temperature in Fahrenheit
# humidity, numeric (int or float), as given by OpenWeather
# uvi, numeric (int or float), as given by OpenWeather
# visibility, numeric (int or float), as given by OpenWeather
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather

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
# {
#             "dt": 1636912800,
#             "sunrise": 1636897431,
#             "sunset": 1636933514,
#             "temp": {
#                 "min": 39.38,
#                 "max": 67.15,
#             },
#             "weather": [
#                 {
#                     "description": "few clouds",
#                     "icon": "02d"
#                 }
#             ],
#         },
# daily_weather, array of the next 5 days of daily weather data:
# date, in a human-readable format such as “2020-09-30”
# sunrise, in a human-readable format such as “2020-09-30 06:27:03 -0600”
# sunset, in a human-readable format such as “2020-09-30 18:27:03 -0600”
# max_temp, floating point number indicating the maximum expected temperature in Fahrenheit
# min_temp, floating point number indicating the minimum expected temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather

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
  # {
  #             "dt": 1636945200,
  #             "temp": 57.45,
  #             "weather": [
  #                 {
  #                     "description": "clear sky",
  #                     "icon": "01n"
  #                 }
  #             ],
  #         },

#  hourly_weather, array of the next 8 hours of hourly weather data:
# time, in a human-readable format such as “14:00:00”
# temperature, floating point number indicating the current temperature in Fahrenheit
# conditions, the first ‘description’ field from the weather data as given by OpenWeather
# icon, string, as given by OpenWeather
end
