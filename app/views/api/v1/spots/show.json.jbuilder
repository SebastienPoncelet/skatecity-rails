json.spot do
  json.extract! @spot, :id, :name, :description, :address, :longitude, :latitude, :user_id, :tag_list, :cached_votes_total

  # Nesting user within the current spot to link data in API.
  json.user do
    json.extract! @spot.user, :open_id, :avatar, :name
  end

  json.images do
    json.array! @spot.images do |image|
      json.extract! image, :id, :url
    end
  end
end
