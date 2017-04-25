class User < ApplicationRecord
  # has_many hangouts, dependent: :destroy
  # has_many confirmations, dependent: :destroy

  # after_create :send_welcome_email
  # before_save :set_avatar_placeholder

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  # mount_uploader :photo, PhotoUploader

# private

#   def set_avatar_placeholder
#     self.avatar_url = "avatar-placeholder.png" unless self.avatar_url.present?
#   end

#   def send_welcome_email
#     UserMailer.welcome(self).deliver_now
#   end

end
