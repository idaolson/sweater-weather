class Image
  attr_reader :location, :image_url, :source, :author, :author_url

  def initialize(location, data)
    @location = location
    @image_url = referral(data[:urls][:regular])
    @source = "Unsplash.com"
    @author = data[:user][:name]
    @author_url = referral(data[:user][:links][:html])
  end

  def referral(url)
    url + "?utm_source=sweater-weather&utm_medium=referral"
  end
end
