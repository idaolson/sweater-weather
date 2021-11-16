class Activity
  attr_reader :destination, :forecast, :activities

  def initialize(address, weather, relax_activity, temp_activity)
    @destination = address
    @forecast = get_forecast(weather)
    @activities = get_activities(relax_activity, temp_activity)
  end

  def get_forecast(weather)
    {
      summary: weather[:conditions],
      temperature: weather[:temperature].round(0).to_s + ' F'
    }
  end

  def get_activities(relax_activity, temp_activity)
    {
      relax_activity[:activity] => activitize(relax_activity),
      temp_activity[:activity] => activitize(temp_activity)
    }
  end

  def activitize(activity)
    {
      type: activity[:type],
      participants: activity[:participants],
      price: activity[:price]
    }
  end

#   {
#     "activity": "Take a hike at a local park",
#     "type": "recreational",
#     "participants": 1,
#     "price": 0,
#     "link": "",
#     "key": "8724324",
#     "accessibility": 0.1
# }
end
#
#
# {
#   "data": {
#     "id": "null",
#     "type": "activities",
#     "attributes": {
#       "destination": "chicago,il",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "45 F"
#       },
#       "activities": {
#         "Learn a new recipe": {
#           "type": "cooking",
#           "participants": 1,
#           "price": 0
#         },
#         "Take a bubble bath": {
#           "type": "relaxation",
#           "participants": 1,
#           "price": 0.5
#         }
#       }
#     }
#   }
# }
