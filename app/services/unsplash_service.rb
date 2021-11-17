class UnsplashService
  def self.get_images(query)
    url = "?query=#{query}"
    UnsplashClient.fetch(url)
  end
end
