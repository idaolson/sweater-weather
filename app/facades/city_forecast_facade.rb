class CityForecastFacade
  def self.city_coords(address)
    result = GeocodeService.get_lat_lng_by_address(address)
    coords = result[:results].first[:locations].first[:latLng]
  end


end
