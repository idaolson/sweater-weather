class BoredService
  def self.find_relaxation_activity
      url = "?type=relaxation"
      BoredClient.fetch(url)
  end

  def self.find_activity_by_temp(temp)
    if temp >= 60
      url = "?type=recreational"
      BoredClient.fetch(url)
    elsif temp >= 50 && temp < 60
      url = "?type=busywork"
      BoredClient.fetch(url)
    else
      url = "?type=cooking"
      BoredClient.fetch(url)
  end
end


# if the temperature is >= 60 F, include one recreational activity.
# if the temperature is >= 50 F and < 60 F, include one busywork activity.
# if the temperature is < 50 F, include one cooking activity.
