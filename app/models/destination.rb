class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  # belongs_to :user

  mount_uploader :photo, PhotoUploader
end
