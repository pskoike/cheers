class Hangout < ApplicationRecord
  belongs_to :user
  belongs_to :place

  geocoded_by :center_address
  after_validation :geocode
end
