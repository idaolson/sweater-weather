class RouteClient
  class << self
    def fetch(url)
      response = conn.get(url + api_key)
      parse(response)
    end

    private
    def api_key
      "&key=#{ENV['map_quest_key']}"
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://www.mapquestapi.com/directions/v2/route')
    end
  end
end
