json.images do
  json.array! @images do |image|
    json.extract! image, :id, :url, :user_id, :spot_id
  end
end
