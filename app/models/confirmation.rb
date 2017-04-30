class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :hangout
  belongs_to :place, optional: true

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :transportation, presence: true
  validates :user_id, presence: true
  validates :hangout_id, presence: true

  geocoded_by :leaving_address
  after_validation :geocode, if: :leaving_address?

end
