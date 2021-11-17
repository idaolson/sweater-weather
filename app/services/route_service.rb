class RouteService
  def self.get_route(start, destination)
    url = "?from=#{start}&to=#{destination}"
    RouteClient.fetch(url)
  end
end
