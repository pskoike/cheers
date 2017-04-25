class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :hangout
  belongs_to :place, optional: true

  geocoded_by :leaving_address
  after_validation :geocode, if: :leaving_address?

end
