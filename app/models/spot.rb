class Spot < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :images
  has_many :reviews # This comes from a gem which allows user to rate this model.
end
