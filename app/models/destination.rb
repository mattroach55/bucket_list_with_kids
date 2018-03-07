class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  belongs_to :user
  # validates :name, presence: true
  # # validates :show, default: true
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end

end
