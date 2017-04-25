class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :hangout
  belongs_to :place
end
