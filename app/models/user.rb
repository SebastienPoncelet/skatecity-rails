class User < ApplicationRecord
  acts_as_voter

  has_many :spots
  has_many :images

  # has_many :reviews
end
