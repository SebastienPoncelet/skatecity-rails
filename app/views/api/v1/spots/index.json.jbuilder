json.spots do
  json.array! @spots do |spot|
    json.extract! spot, :id, :name, :description, :geocoding, :user_id, :tag_list, :cached_votes_total
  end
end
