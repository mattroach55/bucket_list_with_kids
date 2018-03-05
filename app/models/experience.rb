class Experience < ApplicationRecord
  belongs_to :destination
  has_many :reviews
  belongs_to :user
  has_many :bucket_lists

  # mount_uploader :photo, PhotoUploader
end
