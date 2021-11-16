class ActivitySerializer
  include JSONAPI::Serializer

  set_id { nil }
  set_type :activities
  attributes :destination, :forecast, :activities
end
