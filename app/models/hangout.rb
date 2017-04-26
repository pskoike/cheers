class Hangout < ApplicationRecord
  belongs_to :user
  belongs_to :place, optional: true
  has_many :confirmations

  geocoded_by :center_address
  after_validation :geocode, if: :center_address?
end
