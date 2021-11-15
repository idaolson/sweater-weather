class BoredSerializer
  include JSONAPI::Serializer

  set_id { nil }
  set_type :activities
  attributes :destination, :forecast, :activities
  # def self.activity_serializer(location, forecast, activities)
  #   null = nil
  #   {
  #     "data": {
  #       "id": "null",
  #       "type": "activities",
  #       "attributes": {
  #         "destination": location,
  #         "forecast": {
  #           "summary": ,
  #           "temperature":  + '° F'
  #         },
  #         "activities": {
  #           {
  #             "type": ,
  #             "participants": ,
  #             "price":
  #           }
  #         end
  #       }
  #     }
  #   }
  # end
end
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
