class ImageFacade
  def self.get_background(location)
    weather = ForecastFacade.get_weather(location)
    conditions = weather.current_weather[:conditions]
    current_time = weather.current_weather[:datetime].strftime('%H').to_i
    sunrise = weather.current_weather[:sunrise].strftime('%H').to_i
    sunset = weather.current_weather[:sunset].strftime('%H').to_i
    time = daylight(current_time, sunrise, sunset)
    images = UnsplashService.get_images("#{location} #{conditions} #{time}")
    image_data = images[:results].sample
    Image.new(location, image_data)
  end

  def self.daylight(current, sunrise, sunset)
    if current < sunrise || current >= sunset
      'night'
    else
      'day'
    end
  end
end
