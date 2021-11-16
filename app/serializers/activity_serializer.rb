class ActivitySerializer
  include JSONAPI::Serializer

  set_id { nil }
  set_type :activities
  attributes :destination, :forecast, :activities

end
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
