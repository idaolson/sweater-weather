class WeatherClient
  class << self
    def fetch(url)
      response = conn.get(url + api_key)
      parse(response)
    end

    private
    def api_key
      "&appid=#{ENV['open_weather_key']}"
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.openweathermap.org/data/2.5/onecall')
    end
  end
end
