class ImageSerializer
  include JSONAPI::Serializer

  set_id { nil }
  set_type :image
  attributes :location, :image_url, :source, :author, :author_url
end
