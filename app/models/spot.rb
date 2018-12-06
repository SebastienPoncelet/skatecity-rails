class Spot < ApplicationRecord
  acts_as_votable
  acts_as_taggable_on :tags
  belongs_to :user
  has_many :images # This comes from a gem which allows user to rate this model.
  # DB commit, every time we create a new spot instance. The "geocode" method will be called on this instance.
  after_commit :geocode, on: :create

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :address, presence: true

  def geocode
    # API is http://lbs.amap.com/
    if self.address
      results = Geocoder.search(self.address) # array []
        if !results.first.nil?
          result = results.first.coordinates
            self.update_attributes(
            longitude: result.last,
            latitude: result.first
            )
        end
    end
  end
end
