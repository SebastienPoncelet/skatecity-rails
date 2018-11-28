json.spot do
  json.extract! @spot, :id, :name, :description, :geocoding, :user_id, :tag_list

  # Nesting user within the current spot to link data in API.
  json.user do
    json.extract! @spot.user, :open_id, :avatar, :name
  end
end
