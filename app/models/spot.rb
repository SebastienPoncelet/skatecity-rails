class Spot < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :reviews
  ajaxful_rateable :stars => 5, :allow_update => false, :cache_column => "average_rating" # This comes from a gem which allows user to rate this model.
  # No need for a specific rating table.

  validates
end
