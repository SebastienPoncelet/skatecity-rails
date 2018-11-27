json.spots do
  json.array! @spots do |spot|
    json.extract! spot, :id, :name, :description, :geocoding, :user_id
  end
end
