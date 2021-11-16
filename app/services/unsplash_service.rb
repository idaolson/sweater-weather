class UnslashService
  def self.get_weather_by_coords(address)
      url = "?query=chicago,il"
      UnsplashClient.fetch(url)
  end
end
