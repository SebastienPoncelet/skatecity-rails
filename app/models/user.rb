class User < ApplicationRecord
  has_many :spots
  has_many :images
  has_many :ratings
  has_many :reviews

  validates :open_id, presence: true
end
