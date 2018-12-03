json.spots do
  json.array! @spots do |spot|
    json.extract! spot, :id, :name, :description, :address, :longitude, :latitude, :user_id, :tag_list, :cached_votes_total
    json.images do
      json.array! @images do |image|
        json.extract! image, :id, :url
      end
    end
  end

end
