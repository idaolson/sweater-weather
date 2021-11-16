class UnsplashClient
  class << self
    def fetch(url)
      response = conn.get(url + api_key)
      parse(response)
    end

    private
    def api_key
      "&client_id=#{ENV['unsplash_access_key']}"
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.unsplash.com/search/photos')
    end
  end
end
