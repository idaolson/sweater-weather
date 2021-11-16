class BoredClient
  class << self
    def fetch(url)
      response = conn.get(url)
      parse(response)
    end

    private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://www.boredapi.com/api/activity')
    end
  end
end
