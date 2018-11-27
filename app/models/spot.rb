class Spot < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :images # This comes from a gem which allows user to rate this model.
end
