class GeocodeService
  def self.get_lat_lng_by_address(address)
      url = "?location=#{address}"
      GeocodeClient.fetch(url)
  end
end
