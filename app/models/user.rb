class User < ApplicationRecord
  has_many :spots
  has_many :images
  has_many :reviews
  ajaxful_rater # gem which allows a user to rate the target: spot in this case.
  # No need for a specific rating table.

  validates :open_id, presence: true
end
