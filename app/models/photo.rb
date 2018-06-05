class Photo < ApplicationRecord
  belongs_to :accommodation, optional: true
  belongs_to :experience, optional: true
  belongs_to :destination, optional: true
  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :photo
end
